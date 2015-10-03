package SeniorProject_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SeniorProject_Model.Backlog;

/**
 * Servlet implementation class Add_To_Do_Controller
 */
@WebServlet("/Add_To_Do_Controller")
public class AddToDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddToDoController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String dueDate = request.getParameter("dueDate");
		String storyid = request.getParameter("add_to_do_popup_IDtoAdd");
		Backlog b = new Backlog();

		HttpSession session = request.getSession();
		String current_owner = session.getAttribute("uname").toString();

		if (dueDate != null && storyid != null) {
			try {
				b.addStoryToDo(dueDate, storyid, current_owner);
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		session.setAttribute("requestedBy", request.getRequestURL());
		String requestedBy = (String) request.getHeader("Referer");
		response.sendRedirect(requestedBy);
	}
}
