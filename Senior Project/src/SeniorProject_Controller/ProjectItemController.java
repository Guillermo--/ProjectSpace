package SeniorProject_Controller;

import java.io.IOException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SeniorProject_Model.ProjectItem;

@WebServlet("/ProjectItem_Controller")
public class ProjectItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ProjectItemController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String owner = session.getAttribute("uname").toString();
		String projectName = "";
		int projectID = 0;
		ProjectItem project = new ProjectItem();

		if (request.getParameter("project_item") != null) {
			projectName = request.getParameter("project_item");
			projectID = project.getProjectID(projectName, owner);
			session.setAttribute("current_projectName", projectName);
			session.setAttribute("current_projectID", projectID);
			Map<String, Date> sprints = project.getSprintsList(projectID);
			if (sprints.isEmpty()) {
				response.sendRedirect(request.getContextPath() + "/Display_Backlog_Controller");
			}
			else {
				response.sendRedirect(request.getContextPath() + "/Display_Sprint_Controller");
			}
		}

		else {
			response.sendRedirect(request.getContextPath() + "/Display_Backlog_Controller");
		}

	}

	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
