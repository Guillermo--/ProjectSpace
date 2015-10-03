package SeniorProject_Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Backlog {
	String URL = "jdbc:mysql://localhost:3306/seniorproject";
	String USER = "root";
	String PASS = "root";
	String query = "";

	public void insert(ArrayList<String[]> inputs, String projectID)
			throws ClassNotFoundException, SQLException {

		if (!inputs.isEmpty()) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();
			for (int row = 1; row < inputs.get(1).length; row++) {
				query = "INSERT INTO stories (story, hours, priority, notes, status, sprint, projectID) VALUES ('";
				int emptyCols = 0;

				for (int k = 0; k < inputs.size(); k++) {
					System.out.println("k = " + k + ", row = " + row);
					String entry = inputs.get(k)[row];
					System.out.println("Column: " + entry);

					if (entry.equals("")) {
						emptyCols++;
					}

					if (k == inputs.size() - 1) {
						query = query + entry + "','" + projectID + "');";
					} else {
						query = query + "" + entry + "','";
					}

				}

				System.out.println("Empty cols: " + emptyCols);

				if (emptyCols != inputs.size()) {
					stmnt.executeUpdate(query);
				}
			}

			con.close();
			stmnt.close();
		}
	}

	public void update(ArrayList<String[]> toUpdate)
			throws ClassNotFoundException, SQLException {
		String col = "";
		String storyid = "";
		String content = "";
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();

		if (!toUpdate.isEmpty()) {
			for (int i = 0; i < toUpdate.size(); i++) {
				if (i == 0) {
					col = "story";
				}
				if (i == 1) {
					col = "hours";
				}
				if (i == 2) {
					col = "priority";
				}
				if (i == 3) {
					col = "notes";
				}
				if (i == 4) {
					col = "status";
				}
				if (i == 5) {
					col = "sprint";
				}

				String[] currentCol = toUpdate.get(i);

				if (currentCol != null) {
					for (int j = 0; j < currentCol.length; j++) {
						String curr = currentCol[j];
						if (!curr.equals("")) {
							content = Util.extractContent(curr);
							storyid = Util.extractID(curr);

							if (col.equals("hours") && content.equals("")) {
								content = null;
								query = "UPDATE stories SET " + col + "= "
										+ content + " WHERE storyID = '"
										+ storyid + "';";

							} else {

								query = "UPDATE stories SET " + col + "= '"
										+ content + "' WHERE storyID = '"
										+ storyid + "';";
							}
							stmnt.executeUpdate(query);
						}
					}
				}
			}

		}

		stmnt.close();
		con.close();
	}

	public void deleteEmptyRowsFromDB(String projectID)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		ResultSet rs = null;
		String query = "SELECT * FROM stories WHERE projectID = '" + projectID
				+ "';";
		rs = stmnt.executeQuery(query);
		while (rs.next()) {
			String story = rs.getString("story");
			String hours = rs.getString("hours");
			String priority = rs.getString("priority");
			String notes = rs.getString("notes");
			String status = rs.getString("status");
			String sprint = rs.getString("sprint");
			int storyID = rs.getInt("storyID");

			if (story.equals("") && hours == null && priority.equals("")
					&& notes.equals("") && status.equals("")
					&& sprint.equals("")) {
				String query2 = "DELETE FROM stories WHERE storyID ='"
						+ storyID + "';";
				Statement stmnt1 = con.createStatement();
				stmnt1.executeUpdate(query2);
				stmnt1.close();
			}
		}
		con.close();
		stmnt.close();
		rs.close();
	}

	public int getBacklogTotalHours(String projectID)
			throws ClassNotFoundException, SQLException {
		int totalHours = 0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		String query = "SELECT hours FROM stories WHERE projectID = '"
				+ projectID + "';";
		ResultSet rs = stmnt.executeQuery(query);

		while (rs.next()) {
			totalHours = totalHours + rs.getInt("hours");
		}
		rs.close();
		stmnt.close();
		con.close();
		return totalHours;
	}

	public int getBacklogCompletedHours(String projectID)
			throws ClassNotFoundException, SQLException {
		int completedHours = 0;
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		String query = "SELECT hoursDone FROM stories WHERE projectID = '"
				+ projectID + "';";
		ResultSet rs = stmnt.executeQuery(query);

		while (rs.next()) {
			completedHours = completedHours + rs.getInt("hoursDone");
		}

		rs.close();
		stmnt.close();
		con.close();
		return completedHours;
	}

	public int getProgressPercentage(String projectID)
			throws ClassNotFoundException, SQLException {
		int total = getBacklogTotalHours(projectID);
		int completed = getBacklogCompletedHours(projectID);
		int percentageCompleted = 0;

		if (completed == 0 || total == 0) {
			return 0;
		}

		else if (total != 0 && completed != 0) {
			percentageCompleted = (completed * 100) / total;
		}

		return percentageCompleted;
	}

	public void deleteStory(String[] toDelete) throws ClassNotFoundException,
			SQLException {

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		String query = "";

		for (int i = 0; i < toDelete.length; i++) {
			String checkedID = toDelete[i];

			System.out.println("-------To Delete------");
			if (checkedID != null) {
				query = "DELETE FROM stories WHERE storyID = '" + checkedID
						+ "';";
				stmnt.executeUpdate(query);
			}
		}

		stmnt.close();
		con.close();
	}

	public void addStoryToDo(String dueDate, String storyid, String current_user)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		Statement stmnt1 = con.createStatement();
		ResultSet rs = null;
		String query = "";

		if (!dueDate.equals("") && dueDate != null && !storyid.equals("")) {
			query = "SELECT owner FROM stories WHERE storyID = '" + storyid
					+ "';";
			rs = stmnt1.executeQuery(query);
			if (rs.next()) {
				String ownerdb = rs.getString("owner");
				if (ownerdb != null && ownerdb.equals(current_user)) {
					query = "SELECT * FROM to_do WHERE storyID = '" + storyid
							+ "';";
					rs = stmnt.executeQuery(query);

					if (!rs.next()) {
						query = "INSERT INTO to_do (storyID, dueDate) VALUES ('"
								+ storyid + "', '" + dueDate + "')";
						stmnt.executeUpdate(query);
					} else {
						query = "UPDATE to_do SET dueDate = '" + dueDate
								+ "' WHERE storyID = '" + storyid + "';";
						stmnt.executeUpdate(query);
					}
				} else {
					query = "UPDATE stories SET owner = '" + current_user
							+ "' WHERE storyID ='" + storyid + "';";
					stmnt.executeUpdate(query);

					query = "INSERT INTO to_do (storyID, dueDate) VALUES ('"
							+ storyid + "', '" + dueDate + "')";
					stmnt.executeUpdate(query);
				}
			}

		}

		rs.close();
		stmnt.close();
		con.close();
	}

}
