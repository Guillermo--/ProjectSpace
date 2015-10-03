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
import SeniorProject_Model.Backlog;

/**
 * Servlet implementation class Display_Backlog_Controller
 */
@WebServlet("/Display_Backlog_Controller")
public class DisplayBacklogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplayBacklogController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		ProjectItem project = new ProjectItem();
		int pId = (int) session.getAttribute("current_projectID");
		Map<String, Date> sprints = project.getSprintsList(pId);
		
		if (!sprints.isEmpty()) {
			ArrayList<String> sprintsList = new ArrayList<String>();
			for (String s : sprints.keySet()) {
				sprintsList.add(s);
			}

			Collections.sort(sprintsList);
			request.setAttribute("sprintsList", sprintsList);
		}

		ArrayList<ArrayList<String>> backlogData = project.getBacklog(pId);
		Backlog backlog = new Backlog();
		int totalHours = 0;
		int completedHours = 0;

		try {
			totalHours = backlog.getBacklogTotalHours(String.valueOf(pId));
			completedHours = backlog.getBacklogCompletedHours(String
					.valueOf(pId));
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

		String status = (String) session.getAttribute("status");
		session.removeAttribute("status");

		request.setAttribute("status", status);
		request.setAttribute("backlog", backlogData);
		request.setAttribute("totalHours", totalHours);
		request.setAttribute("completedHours", completedHours);
		request.getRequestDispatcher("/ProjectItem_Backlog.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
