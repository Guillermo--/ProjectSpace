package SeniorProject_Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class User {
	String URL = "jdbc:mysql://localhost:3306/seniorproject";
	String USER = "root";
	String PASS = "root";
	String UserName = null;

	public boolean join(String uname, String pwd1, String pwd2) {
		boolean status = false;

		if (uname != null && pwd1 != null && pwd2 != null) {
			if (pwd1.equals(pwd2)) {
				String query = "INSERT INTO users (Name, Password) VALUES ('"
						+ uname + "', '" + pwd1 + "');";
				try {
					Class.forName("com.mysql.jdbc.Driver");
					Connection con = DriverManager.getConnection(URL, USER,
							PASS);
					Statement stmnt = con.createStatement();
					stmnt.executeUpdate(query);
					con.close();
					stmnt.close();
					status = true;

				} catch (SQLException e) {
					e.printStackTrace();
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				}
			}
		}

		return status;
	}

	public boolean login(String user, String pwd) {
		boolean status = false;
		if (user != null && pwd != null) {
			String query = "SELECT * FROM users WHERE Name = '" + user
					+ "' AND Password = '" + pwd + "';";
			try {
				Class.forName("com.mysql.jdbc.Driver");
				Connection con = DriverManager.getConnection(URL, USER, PASS);
				Statement stmnt = con.createStatement();
				ResultSet rs = stmnt.executeQuery(query);
				if (rs.next()) {
					status = true;
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

		return status;
	}

	public ArrayList<ArrayList<String>> getProjects(String user) {
		ArrayList<ArrayList<String>> projects = new ArrayList<ArrayList<String>>();
		String query = "SELECT projectName FROM projects WHERE owner = '"
				+ user + "';";
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DriverManager.getConnection(URL, USER, PASS);
			Statement stmnt = con.createStatement();
			ResultSet rs = stmnt.executeQuery(query);
			Backlog b = new Backlog();
			ProjectItem p = new ProjectItem();
			while (rs.next()) {

				ArrayList<String> projectItem = new ArrayList<String>();
				String projectName = rs.getString("projectName");
				String projectID = String.valueOf(p.getProjectID(projectName,
						user));

				String percent = String.valueOf(b
						.getProgressPercentage(projectID));

				projectItem.add(projectName);
				projectItem.add(percent + "%");

				projects.add(projectItem);
			}

			con.close();
			rs.close();
			stmnt.close();
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		return projects;
	}

	public ArrayList<ArrayList<String>> getComingUp(String owner)
			throws ClassNotFoundException, SQLException {
		ArrayList<ArrayList<String>> info = new ArrayList<ArrayList<String>>();

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		String query = "SELECT * FROM to_do INNER JOIN stories ON stories.storyID=to_do.storyID INNER JOIN projects ON stories.projectID=projects.projectID WHERE stories.owner='"
				+ owner + "' ORDER BY dueDate DESC;";
		ResultSet rs = stmnt.executeQuery(query);

		while (rs.next()) {
			ArrayList<String> item = new ArrayList<String>();

			String projectName = rs.getString("projectName");
			String sprint = rs.getString("sprint");
			String storyName = rs.getString("story");
			String dueDate = rs.getString("dueDate");
			String storyID = rs.getString("storyID");

			item.add(projectName);
			item.add(sprint);
			item.add(storyName);
			item.add(dueDate);
			item.add(storyID);

			info.add(item);
		}

		return info;
	}

}
