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
 * Servlet implementation class Join
 */
@WebServlet("/Join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public JoinController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String uname = request.getParameter("user");
		String pwd1 = request.getParameter("password-1");
		String pwd2 = request.getParameter("password-2");

		User user = new User();
		boolean status = user.join(uname, pwd1, pwd2);

		if (status == true) {
			HttpSession session = request.getSession();
			session.setAttribute("uname", uname);
			request.getRequestDispatcher("/Main.jsp").forward(request, response);
		} else {
			request.setAttribute("error", "Passwords must match!");
			request.getRequestDispatcher("/Welcome2.jsp").forward(request, response);
		}
	}

}
