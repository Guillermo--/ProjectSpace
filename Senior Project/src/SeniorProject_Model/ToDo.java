package SeniorProject_Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class ToDo {
	String URL = "jdbc:mysql://localhost:3306/seniorproject";
	String USER = "root";
	String PASS = "root";
	String query = "";

	public void deleteToDoItem(String storyID) throws ClassNotFoundException,
			SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		query = "DELETE FROM to_do WHERE storyID='" + storyID + "';";
		stmnt.executeUpdate(query);
		stmnt.close();
		con.close();
	}

	public boolean contains(String storyID) throws ClassNotFoundException,
			SQLException {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		String query = "SELECT * FROM to_do WHERE storyID = '" + storyID + "';";
		ResultSet rs = stmnt.executeQuery(query);
		boolean result = false;
		if (rs.next()) {
			result = true;
		}

		rs.close();
		stmnt.close();
		con.close();

		return result;

	}

}
