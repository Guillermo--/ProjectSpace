package SeniorProject_Model;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ProjectItem {

	String URL = "jdbc:mysql://localhost:3306/seniorproject";
	String USER = "root";
	String PASS = "root";

	public void createProject(String name, String owner, String date,
			String description) {
		if (name != null) {
			String query = "INSERT INTO projects (projectName, owner, dateStarted, description) VALUES ('"
					+ name
					+ "', '"
					+ owner
					+ "', '"
					+ date
					+ "', '"
					+ description + "');";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(URL, USER, PASS);
				Statement stmnt = con.createStatement();
				stmnt.executeUpdate(query);

				con.close();
				stmnt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
	}

	public int getProjectID(String projectName, String owner) {
		int projectid = -1;

		if (projectName != null) {
			String query = "SELECT projectID FROM projects WHERE projectName = '"
					+ projectName + "' AND owner = '" + owner + "';";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(URL, USER, PASS);
				Statement stmnt = con.createStatement();
				ResultSet rs = stmnt.executeQuery(query);

				if (rs.next()) {
					projectid = rs.getInt("projectID");
				}
				con.close();
				rs.close();
				stmnt.close();

			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return projectid;
	}

	public Map<String, Date> getSprintsList(int projectID) {

		Map<String, Date> sprints = new HashMap<String, Date>();

		if (projectID != -1) {
			String query = "SELECT sprintTitle, dueDate FROM sprints WHERE projectID = '"
					+ projectID + "';";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(URL, USER, PASS);
				Statement stmnt = con.createStatement();
				ResultSet rs = stmnt.executeQuery(query);

				while (rs.next())// Match
				{
					sprints.put(rs.getString("sprintTitle"),
							rs.getDate("dueDate"));
				}
				con.close();
				rs.close();
				stmnt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			}
		}
		return sprints;
	}

	public ArrayList<ArrayList<String>> getBacklog(int projectID) {
		ArrayList<ArrayList<String>> rows_all = new ArrayList<ArrayList<String>>();

		String query = "SELECT story, hours, priority, notes, status, sprint, storyID FROM stories WHERE projectID = '"
				+ projectID + "' ORDER BY sprint ASC;";

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();
			ResultSet rs = stmnt.executeQuery(query);

			while (rs.next()) {
				ArrayList<String> rows_single = new ArrayList<String>();

				rows_single.add(rs.getString("story"));
				rows_single.add(rs.getString("hours"));
				rows_single.add(rs.getString("priority"));
				rows_single.add(rs.getString("notes"));
				rows_single.add(rs.getString("status"));
				rows_single.add(rs.getString("sprint"));
				rows_single.add(rs.getString("storyID"));

				rows_all.add(rows_single);
			}

			con.close();
			rs.close();
			stmnt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return rows_all;
	}

	public String getCurrentSprintName(Map<String, Date> map) {
		String currentSprint = null;

		if (!map.isEmpty()) {
			java.util.Date todayDate = Calendar.getInstance().getTime();
			ArrayList<Date> arraydates = new ArrayList<Date>();
			Date currentsprint = null;

			for (Date d : map.values()) {
				if (d != null) {
					arraydates.add(d);
				}
			}

			if (!arraydates.isEmpty())// There are non-null dates
			{
				Collections.sort(arraydates);

				for (int i = 0; i < arraydates.size(); i++) {
					if (todayDate.before(arraydates.get(i))
							|| todayDate.equals(arraydates.get(i))) {
						currentsprint = arraydates.get(i);
						break;
					}
				}

				if (currentsprint == null) {
					currentsprint = arraydates.get(0);
				}

				for (String s : map.keySet()) {
					if (map.get(s) == currentsprint) {
						currentSprint = s;
						break;
					}
				}
			}

			else {
				ArrayList<String> arrayNames = new ArrayList<String>();

				for (String s : map.keySet()) {
					if (!s.equals("") && s != null) {
						arrayNames.add(s);
					}
				}
				Collections.sort(arrayNames);
				currentSprint = arrayNames.get(0);
			}
		}

		return currentSprint;
	}

	public ArrayList<String> getChartEligibleSprints(String projectID)
			throws SQLException, ClassNotFoundException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		String query = "SELECT * FROM sprints WHERE projectID ='" + projectID
				+ "';";
		ResultSet rs = stmnt.executeQuery(query);

		ArrayList<String> sprintsForChart = new ArrayList<String>();

		while (rs.next()) {
			Date startdate = rs.getDate("startDate");
			Date enddate = rs.getDate("dueDate");
			String sprintid = rs.getString("sprintID");

			if (startdate != null && enddate != null
					&& startdate.before(enddate)) {
				sprintsForChart.add(sprintid);
			}
		}

		rs.close();
		stmnt.close();
		con.close();

		return sprintsForChart;

	}

}
