package SeniorProject_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SeniorProject_Model.User;
import SeniorProject_Model.ProjectItem;

/**
 * Servlet implementation class DisplayProjects
 */
@WebServlet("/DisplayProjects_Controller")
public class DisplayProjectsController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DisplayProjectsController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String user = session.getAttribute("uname").toString();
		User u = new User();

		if (user != null) {
			ArrayList<ArrayList<String>> projects = u.getProjects(user);

			try {
				ArrayList<ArrayList<String>> comingup = u.getComingUp(user);
				request.setAttribute("comingup", comingup);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			session.setAttribute("projects", projects);
			request.getRequestDispatcher("/Main.jsp").forward(request, response);
		}

		else {
			response.sendRedirect("error-500.jsp");
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
