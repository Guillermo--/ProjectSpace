package SeniorProject_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SeniorProject_Model.Sprint;

/**
 * Servlet implementation class Add_Hours_Controller
 */
@WebServlet("/Add_Hours_Controller")
public class AddHoursController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddHoursController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String hour = request.getParameter("hours");
		String storyid = request.getParameter("add_hours_popup_IDtoAdd");
		Sprint sprintObject = new Sprint();

		try {
			sprintObject.addHours(storyid, hour);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		String requestedBy = (String) request.getHeader("Referer");
		response.sendRedirect(requestedBy);
	}

}
