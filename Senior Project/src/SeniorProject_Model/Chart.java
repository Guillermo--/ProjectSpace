package SeniorProject_Model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

public class Chart {

	ArrayList<Pair> dataList = new ArrayList<Chart.Pair>();
	String URL = "jdbc:mysql://localhost:3306/seniorproject";
	String USER = "root";
	String PASS = "root";
	String query = "";

	public ArrayList<Pair> getDataList() {
		return dataList;
	}

	public void setDataList(String sprintID) throws ClassNotFoundException,
			SQLException {
		Sprint sprintObject = new Sprint();
		ArrayList<String> workdates = sprintObject.getWorkDates(sprintID);
		int sprintDuration = workdates.size();
		ArrayList<String> daysToShow = new ArrayList<String>();

		if (sprintDuration < 14) {
			for (int i = 0; i < sprintDuration; i++) {
				String date = workdates.get(i);
				daysToShow.add(date);
			}
		}

		else if (sprintDuration >= 14) {
			for (int i = 0; i < sprintDuration + 1; i = i + 2) {
				if (((sprintDuration - 1) - i) == 1) {
					String date = workdates.get(i);
					date = workdates.get(i);
					daysToShow.add(date);
					date = workdates.get(i + 1);
					daysToShow.add(date);
					break;
				}

				else {
					String date = workdates.get(i);
					daysToShow.add(date);
				}
			}
		}

		ArrayList<String> formattedDaysToShow = formatDates(daysToShow);

		ArrayList<String> idealHours = calculateIntervalIdealHours(daysToShow,
				sprintID);

		ArrayList<String> actualHours = calculateIntervalActualHours(
				daysToShow, sprintID);

		for (int i = 0; i < formattedDaysToShow.size(); i++) {
			String day = formattedDaysToShow.get(i);
			String actualHour = actualHours.get(i);
			String idealHour = idealHours.get(i);

			Pair pair = new Pair(day, actualHour, idealHour);
			this.dataList.add(pair);
		}

	}

	public ArrayList<String> formatDates(ArrayList<String> dates) {
		ArrayList<String> formattedDaysToShow = new ArrayList<String>();
		String day = null;
		String month = null;

		for (int i = 0; i < dates.size(); i++) {
			String current = dates.get(i);
			String[] splitDate = current.split("-");
			day = splitDate[1];
			month = splitDate[2];
			String newDate = day + "/" + month;
			formattedDaysToShow.add(newDate);
		}

		return formattedDaysToShow;
	}

	public ArrayList<String> calculateIntervalActualHours(
			ArrayList<String> dates, String sprintID) throws SQLException,
			ClassNotFoundException {

		Sprint sprintObject = new Sprint();
		ArrayList<String> hoursAtInterval = new ArrayList<String>();

		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection(URL, USER, PASS);
		Statement stmnt = con.createStatement();
		String query = null;
		ResultSet rs = null;

		for (int i = 0; i < dates.size(); i++) {
			String date = dates.get(i);

			int remainingHours = sprintObject.getSprintTotalHours(sprintID);
			query = "SELECT * FROM stories INNER JOIN dates ON stories.storyID=dates.storyid WHERE stories.sprintID ='"
					+ sprintID + "' AND dates.date <= '" + date + "';";
			rs = stmnt.executeQuery(query);

			while (rs.next()) {
				int intervalHours = 0;
				int partialHours = rs.getInt("dates.hours");
				intervalHours = intervalHours + partialHours;
				remainingHours = remainingHours - intervalHours;
			}

			hoursAtInterval.add(String.valueOf(remainingHours));
		}

		rs.close();
		stmnt.close();
		con.close();

		return hoursAtInterval;
	}

	public ArrayList<String> calculateIntervalIdealHours(
			ArrayList<String> dates, String sprintID) throws SQLException,
			ClassNotFoundException {
		Sprint sprintObject = new Sprint();
		int totalHours = sprintObject.getSprintTotalHours(sprintID);
		int sprintDuration = dates.size();
		int idealHours = 0;
		int extra = 0;
		ArrayList<String> hoursAtInterval = new ArrayList<String>();

		if (totalHours != 0) {
			extra = totalHours % sprintDuration;
			idealHours = totalHours / sprintDuration;
		}

		for (int i = 0; i < sprintDuration; i++) {
			if (sprintDuration - i <= extra) {
				totalHours = totalHours - 1;
			}

			totalHours = totalHours - idealHours;
			hoursAtInterval.add(String.valueOf(totalHours));

		}

		return hoursAtInterval;
	}

	public static class Pair {
		String day;
		String actualHours;
		String idealHours;

		public Pair(String day, String actualHours, String idealHours) {
			super();
			this.day = day;
			this.actualHours = actualHours;
			this.idealHours = idealHours;
		}

		public String getDay() {
			return day;
		}

		public void setDay(String day) {
			this.day = day;
		}

		public String getActualHours() {
			return actualHours;
		}

		public void setActualHours(String actualHours) {
			this.actualHours = actualHours;
		}

		public String getIdealHours() {
			return idealHours;
		}

		public void setIdealHours(String idealHours) {
			this.idealHours = idealHours;
		}

	}

}