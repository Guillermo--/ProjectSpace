package SeniorProject_Controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SeniorProject_Model.Chart;
import SeniorProject_Model.Chart.Pair;
import SeniorProject_Model.ProjectItem;
import SeniorProject_Model.Sprint;

/**
 * Servlet implementation class GetChartData
 */
@WebServlet("/GetChartData_Controller")
public class GetChartDataController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public GetChartDataController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int projectID = (int) session.getAttribute("current_projectID");

		ProjectItem projectitem = new ProjectItem();
		ArrayList<ArrayList<Pair>> charts = new ArrayList<ArrayList<Pair>>();

		try {
			ArrayList<String> eligibleSprints = projectitem.getChartEligibleSprints(String.valueOf(projectID));

			for (int i = 0; i < eligibleSprints.size(); i++) {
				String sprintid = eligibleSprints.get(i);
				Chart chart = new Chart();
				chart.setDataList(sprintid);
				ArrayList<Pair> dataForChart = chart.getDataList();
				charts.add(dataForChart);
			}

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		Map<String, Date> sprints = projectitem.getSprintsList(projectID);
		ArrayList<String> sprintsDrop = new ArrayList<String>();
		if (!sprints.isEmpty()) {
			for (String s : sprints.keySet()) {
				sprintsDrop.add(s);
			}
		}

		Collections.sort(sprintsDrop);
		request.setAttribute("sprintsList", sprintsDrop);
		request.setAttribute("charts", charts);
		request.getRequestDispatcher("/Charts.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

	}

}
