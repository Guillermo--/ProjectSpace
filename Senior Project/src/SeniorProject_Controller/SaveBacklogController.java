package SeniorProject_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SeniorProject_Model.Backlog;
import SeniorProject_Model.Sprint;

/**
 * Servlet implementation class Save_Backlog_Controller
 */
@WebServlet("/Save_Backlog_Controller")
public class SaveBacklogController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveBacklogController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String buttonDelete = request.getParameter("buttonDelete");
		Backlog backlog = new Backlog();
		HttpSession session = request.getSession();
		String projectID = session.getAttribute("current_projectID").toString();

		if (buttonDelete != null) {
			String[] checked = request.getParameterValues("backlog-checkbox");
			if (checked != null) {
				try {
					backlog.deleteStory(checked);
					session.setAttribute("status", "saved");
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
			}
			response.sendRedirect(request.getContextPath() + "/Display_Backlog_Controller");
		}

		else {
			String[] new_story = request.getParameterValues("entry-story");
			String[] new_hours = request.getParameterValues("entry-hours");
			String[] new_priority = request.getParameterValues("entry-priority");
			String[] new_notes = request.getParameterValues("entry-notes");
			String[] new_status = request.getParameterValues("entry-status");
			String[] new_sprint = request.getParameterValues("entry-sprint");
			String[] backlog_story = request.getParameterValues("backlog-story");
			String[] backlog_hours = request.getParameterValues("backlog-hours");
			String[] backlog_priority = request.getParameterValues("backlog-priority");
			String[] backlog_notes = request.getParameterValues("backlog-notes");
			String[] backlog_status = request.getParameterValues("backlog-status");
			String[] backlog_sprint = request.getParameterValues("backlog-sprint");
			ArrayList<String[]> inputs = new ArrayList<String[]>();
			ArrayList<String[]> toUpdate = new ArrayList<String[]>();

			inputs.add(new_story);
			inputs.add(new_hours);
			inputs.add(new_priority);
			inputs.add(new_notes);
			inputs.add(new_status);
			inputs.add(new_sprint);

			toUpdate.add(backlog_story);
			toUpdate.add(backlog_hours);
			toUpdate.add(backlog_priority);
			toUpdate.add(backlog_notes);
			toUpdate.add(backlog_status);
			toUpdate.add(backlog_sprint);

			try {
				System.out.println("Backlog Update");
				backlog.update(toUpdate);
				System.out.println("Backlog Insert");
				backlog.insert(inputs, projectID);

				Sprint sprint = new Sprint();
				sprint.createSprint(projectID, backlog_sprint);
				sprint.createSprint(projectID, new_sprint);
				backlog.deleteEmptyRowsFromDB(projectID);

			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			session.setAttribute("status", "saved");
			response.sendRedirect(request.getContextPath() + "/Display_Backlog_Controller");
		}
	}
}
