package SeniorProject_Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

public class Sprint {

	String URL = "jdbc:mysql://localhost:3306/seniorproject";
	String USER = "root";
	String PASS = "root";
	String query = "";

	public void createSprint(String projectID, String[] sprints)
			throws ClassNotFoundException, SQLException {
		if (sprints != null) {
			Map<String, Integer> noDupes = removeDupeAndClean(sprints);
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();
			ResultSet rs = null;

			for (String s : noDupes.keySet()) {
				int count = noDupes.get(s);
				query = "SELECT * FROM sprints WHERE sprintTitle = '" + s
						+ "' AND projectID = '" + projectID + "';";
				rs = stmnt.executeQuery(query);

				if (!rs.next()) {
					if (count == 1 && !s.equals("")) {
						query = "INSERT INTO sprints (projectID, sprintTitle) VALUES ('"
								+ projectID + "','" + s + "');";
						stmnt.executeUpdate(query);
					}
				}

				query = "SELECT sprintID FROM sprints WHERE projectID = '"
						+ projectID + "' AND sprintTitle = '" + s + "';";
				rs = stmnt.executeQuery(query);

				if (rs.next()) {
					int sprintid = rs.getInt("sprintID");

					query = "UPDATE stories SET sprintID = '" + sprintid
							+ "' WHERE projectID = '" + projectID
							+ "' AND sprint = '" + s + "';";
					stmnt.executeUpdate(query);
				}
			}
			con.close();
			stmnt.close();
			rs.close();
		}

	}

	public Map<String, Integer> removeDupeAndClean(String[] sprints) {
		Map<String, Integer> removeDupe = new HashMap<String, Integer>();
		for (int i = 0; i < sprints.length; i++) {
			String curr = Util.extractContent(sprints[i]);
			if (!removeDupe.containsKey(curr)) {
				removeDupe.put(curr, 1);
			} else {
				int temp = removeDupe.get(curr) + 1;
				removeDupe.put(curr, temp);
			}
		}
		return removeDupe;
	}

	public int getSprintID(int projectID, String sprint)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		ResultSet rs = null;
		int sprintID;
		query = "SELECT sprintID FROM sprints WHERE projectID = '" + projectID
				+ "' AND sprintTitle = '" + sprint + "'";
		rs = stmnt.executeQuery(query);

		if (rs.next()) {
			sprintID = rs.getInt("sprintID");// There should only be one match
		} else {
			sprintID = -1;
		}

		rs.close();
		stmnt.close();
		con.close();
		return sprintID;
	}

	public int getSprintTotalHours(String sprintID)
			throws ClassNotFoundException, SQLException {
		int totalHours = 0;

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		query = "SELECT hours FROM stories WHERE sprintID = '" + sprintID
				+ "';";
		ResultSet rs = stmnt.executeQuery(query);

		while (rs.next()) {
			totalHours = totalHours + rs.getInt("hours");
		}

		rs.close();
		stmnt.close();
		con.close();

		return totalHours;
	}

	public int getSprintCompletedHours(String sprintID)
			throws ClassNotFoundException, SQLException {
		int completedHours = 0;

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		query = "SELECT hoursDone FROM stories WHERE sprintID = '" + sprintID
				+ "';";
		ResultSet rs = stmnt.executeQuery(query);

		while (rs.next()) {
			completedHours = completedHours + rs.getInt("hoursDone");
		}

		rs.close();
		stmnt.close();
		con.close();

		return completedHours;

	}

	public void insertStory(ArrayList<String[]> newStories, String sprintID,
			String projectID, String sprintName) throws ClassNotFoundException,
			SQLException {
		if (!newStories.isEmpty()) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();

			for (int row = 1; row < newStories.get(1).length; row++) {
				query = "INSERT INTO stories (story, hours, hoursDone, priority, owner, notes, status, sprint, sprintID, projectID) VALUES ('";

				int emptyCols = 0;

				for (int k = 0; k < newStories.size(); k++) {
					String entry = newStories.get(k)[row];

					if (entry.equals("")) {
						emptyCols++;
					}

					if (k == newStories.size() - 1) {
						query = query + entry + "', '" + sprintName + "', '"
								+ sprintID + "', '" + projectID + "');";
					} else {
						query = query + "" + entry + "','";
					}
				}

				if (emptyCols != newStories.size()) {
					stmnt.executeUpdate(query);

				}
			}

			con.close();
			stmnt.close();
		}
	}

	public void setDueDate(String dueDateString, String sprintID)
			throws ClassNotFoundException, SQLException {
		if (!dueDateString.equals("")) {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();
			query = "";

			query = "UPDATE sprints SET dueDate ='" + dueDateString
					+ "' WHERE sprintID = '" + sprintID + "';";
			stmnt.executeUpdate(query);

			stmnt.close();
			con.close();
		}

	}

	public Date getDueDate(int sprintID) throws ClassNotFoundException,
			SQLException {
		Date dueDate = null;

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		ResultSet rs = null;
		query = "";

		if (sprintID != -1) {
			query = "SELECT dueDate FROM sprints WHERE sprintID = '" + sprintID
					+ "';";
			rs = stmnt.executeQuery(query);

			if (rs.next()) {
				dueDate = rs.getDate("dueDate");
			}
		}

		rs.close();
		stmnt.close();
		con.close();

		return dueDate;
	}

	public void setStartDate(String startDateString, String sprintID)
			throws ClassNotFoundException, SQLException {
		if (!startDateString.equals("")) {

			System.out.println("String dueDate: " + startDateString);

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();
			query = "";

			query = "UPDATE sprints SET startDate ='" + startDateString
					+ "' WHERE sprintID = '" + sprintID + "';";
			stmnt.executeUpdate(query);

			stmnt.close();
			con.close();
		}

	}

	public Date getStartDate(int sprintID) throws ClassNotFoundException,
			SQLException {
		Date startDate = null;

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		ResultSet rs = null;
		query = "";

		if (sprintID != -1) {
			query = "SELECT startDate FROM sprints WHERE sprintID = '"
					+ sprintID + "';";
			rs = stmnt.executeQuery(query);

			if (rs.next()) {
				startDate = rs.getDate("startDate");
			}
		}

		rs.close();
		stmnt.close();
		con.close();

		return startDate;
	}

	public void updateStory(ArrayList<String[]> toUpdate, String current_user)
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
					col = "hoursDone";
				}
				if (i == 3) {
					col = "priority";
				}
				if (i == 4) {
					col = "owner";
				}
				if (i == 5) {
					col = "notes";
				}
				if (i == 6) {
					col = "status";
				}

				String[] currentCol = toUpdate.get(i);

				if (currentCol != null) {
					for (int j = 0; j < currentCol.length; j++) {
						String curr = currentCol[j];
						if (!curr.equals("")) {
							content = Util.extractContent(curr);
							storyid = Util.extractID(curr);

							if (col.equals("owner")
									&& !content.equals(current_user)) {
								query = "DELETE FROM to_do WHERE storyID ='"
										+ storyid + "';";
								stmnt.executeUpdate(query);
							}

							if ((col.equals("hours") || col.equals("hoursDone"))
									&& content.equals("")) {
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
	}

	public ArrayList<ArrayList<String>> getSprintData(int sprintID)
			throws ClassNotFoundException, SQLException {
		ArrayList<ArrayList<String>> allRows = new ArrayList<ArrayList<String>>();
		ToDo todo = new ToDo();

		if (sprintID != -1) {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();
			query = "SELECT story, hours, hoursDone, priority, owner, notes, status, storyID, sprint FROM stories WHERE sprintID = '"
					+ sprintID + "';";
			ResultSet rs = stmnt.executeQuery(query);

			while (rs.next()) {

				ArrayList<String> row = new ArrayList<String>();

				String story = rs.getString("story");
				String hours = rs.getString("hours");
				String hours_done = rs.getString("hoursDone");
				String priority = rs.getString("priority");
				String owner = rs.getString("owner");
				String notes = rs.getString("notes");
				String status = rs.getString("status");
				String storyID = rs.getString("storyID");

				if (!rs.getString("sprint").equals("")) {
					row.add(story);
					row.add(hours);
					row.add(hours_done);
					row.add(priority);
					row.add(owner);
					row.add(notes);
					row.add(status);
					row.add(storyID);

					boolean isToDo = todo.contains(storyID);
					row.add(String.valueOf(isToDo));

					allRows.add(row);

				}
			}

			con.close();
			rs.close();
			stmnt.close();

		}

		return allRows;

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
			String hours_done = rs.getString("hoursDone");
			String priority = rs.getString("priority");
			String notes = rs.getString("notes");
			String status = rs.getString("status");
			int storyID = rs.getInt("storyID");

			if (story.equals("") && hours == null && hours_done == null
					&& priority.equals("") && notes.equals("")
					&& status.equals("")) {
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

	public void addHours(String storyid, String hours)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		Statement s1 = con.createStatement();
		ResultSet rs1 = null;
		Statement s2 = con.createStatement();
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		Date dateobj = new Date();
		String today = df.format(dateobj);
		String query = "INSERT INTO dates (storyid, hours, date) VALUES ('"
				+ storyid + "', '" + hours + "','" + today + "');";
		stmnt.executeUpdate(query);

		query = "SELECT hoursDone FROM stories WHERE storyID = '" + storyid
				+ "';";
		rs1 = s1.executeQuery(query);

		int hoursDone = 0;
		int hoursNew = Integer.parseInt(hours);

		if (rs1.next()) {
			hoursDone = rs1.getInt("hoursDone");
		}

		int finalHours = hoursDone + hoursNew;

		query = "UPDATE stories SET hoursDone = '" + finalHours
				+ "' WHERE storyID = '" + storyid + "';";
		s1.executeUpdate(query);

		stmnt.close();
		con.close();
	}

	public ArrayList<String> getWorkDates(String sprintID)
			throws ClassNotFoundException, SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		ResultSet rs = null;

		Date d1 = null;
		Date d2 = null;

		String query = "SELECT startDate, dueDate FROM sprints WHERE sprintID ='"
				+ sprintID + "';";
		rs = stmnt.executeQuery(query);

		if (rs.next()) {
			d1 = rs.getDate("startDate");
			d2 = rs.getDate("dueDate");
		}

		ArrayList<String> dates = new ArrayList<String>();

		if (d1 != null && d2 != null) {
			Calendar cal = Calendar.getInstance();
			cal.setTime(d1);
			while (cal.getTime().before(d2) || cal.getTime().equals(d2)) {
				Date d = cal.getTime();

				String formattedDate = new SimpleDateFormat("yyyy-MM-dd")
						.format(d);

				dates.add(formattedDate);
				cal.add(Calendar.DATE, 1);
			}
		}

		rs.close();
		stmnt.close();
		con.close();

		return dates;
	}
}
