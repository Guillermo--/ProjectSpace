package SeniorProject_Controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import SeniorProject_Model.User;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login_Controller")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String user = request.getParameter("user");
		String pwd = request.getParameter("password");

		User u = new User();
		boolean status = u.login(user, pwd);

		if (status == true) {
			HttpSession session = request.getSession();
			session.setAttribute("uname", user);
			response.sendRedirect(request.getContextPath()  + "/DisplayProjects_Controller");
		}

		else {
			request.setAttribute("error", "Incorrect user name or password");
			request.getRequestDispatcher("/Welcome2.jsp").forward(request, response);
		}
	}
}
