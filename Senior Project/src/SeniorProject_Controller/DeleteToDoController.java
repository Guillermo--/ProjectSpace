package SeniorProject_Controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import SeniorProject_Model.ToDo;

/**
 * Servlet implementation class Delete_To_Do_Controller
 */
@WebServlet("/Delete_To_Do_Controller")
public class DeleteToDoController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteToDoController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String todelete = request.getParameter("to_delete_id").toString();
		ToDo todo = new ToDo();
		try {
			todo.deleteToDoItem(todelete);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect(request.getContextPath() + "/DisplayProjects_Controller");
	}

}
