package SeniorProject_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import SeniorProject_Model.ProjectItem;

/**
 * Servlet implementation class New_Project_Controller
 */
@WebServlet("/NewProject_Controller")
public class NewProjectController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public NewProjectController() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String projectName = request.getParameter("projectName");
		String startDate = request.getParameter("dateStarted");
		String projectDescription = request.getParameter("projectDescription");
		HttpSession session = request.getSession();
		String owner = session.getAttribute("uname").toString();
		ProjectItem newp = new ProjectItem();
		newp.createProject(projectName, owner, startDate, projectDescription);
		response.sendRedirect(request.getContextPath() + "/DisplayProjects_Controller");
	}
}
