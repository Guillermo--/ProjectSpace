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

import SeniorProject_Model.ProjectItem;
import SeniorProject_Model.Sprint;

/**
 * Servlet implementation class Display_Sprint_Controller
 */
@WebServlet("/Display_Sprint_Controller")
public class DisplaySprintController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplaySprintController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProjectItem project = new ProjectItem();
		Sprint sprintObject = new Sprint();
		int projectID = (int) session.getAttribute("current_projectID");
		String sprintName = request.getParameter("sprint");
		Map<String, Date> sprints = project.getSprintsList(projectID);

		if (session.getAttribute("status") != null) {
			sprintName = (String) session.getAttribute("current_sprint");
		}

		else if (sprintName == null) {
			sprintName = project.getCurrentSprintName(sprints);
		}

		ArrayList<String> sprintsDrop = new ArrayList<String>();
		if (!sprints.isEmpty()) {
			for (String s : sprints.keySet()) {
				sprintsDrop.add(s);
			}
		}

		Collections.sort(sprintsDrop);
		request.setAttribute("sprintsList", sprintsDrop);

		try {
			int sprintID = sprintObject.getSprintID(projectID, sprintName);
			ArrayList<ArrayList<String>> sprintsList = sprintObject.getSprintData(sprintID);
			java.util.Date dueDate = sprintObject.getDueDate(sprintID);
			java.util.Date startDate = sprintObject.getStartDate(sprintID);

			request.setAttribute("dueDate", dueDate);
			request.setAttribute("startDate", startDate);
			request.setAttribute("sprintTitle", sprintName);

			int totalHours = sprintObject.getSprintTotalHours(String.valueOf(sprintID));
			int completedHours = sprintObject.getSprintCompletedHours(String.valueOf(sprintID));

			session.setAttribute("current_sprint", sprintName);

			request.setAttribute("sprint", sprintsList);
			request.setAttribute("totalHours", totalHours);
			request.setAttribute("completedHours", completedHours);

			String status = (String) session.getAttribute("status");
			session.removeAttribute("status");
			System.out.println("Status: " + status);
			request.setAttribute("status", status);
			request.getRequestDispatcher("/ProjectItem_Sprint.jsp").forward(request, response);

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
