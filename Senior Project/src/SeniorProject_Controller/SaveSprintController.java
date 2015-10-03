package SeniorProject_Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import SeniorProject_Model.Backlog;
import SeniorProject_Model.Sprint;

/**
 * Servlet implementation class Save_Sprint_Controller
 */
@WebServlet("/Save_Sprint_Controller")
public class SaveSprintController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveSprintController() {
		super();
	}

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String projectID = session.getAttribute("current_projectID").toString();
		String sprintName = session.getAttribute("current_sprint").toString();
		String current_user = session.getAttribute("uname").toString();
		Backlog backlog = new Backlog();
		String buttonDelete = request.getParameter("buttonDelete");

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
			response.sendRedirect(request.getContextPath() + "/Display_Sprint_Controller");
		}

		else {
			String[] dayHours = request.getParameterValues("backlog-calendar-hours");
			String[] hoursid = request.getParameterValues("hours-id");
			String[] dates = request.getParameterValues("dates");
			String[] new_story = request.getParameterValues("entry-story");
			String[] new_hours = request.getParameterValues("entry-hours");
			String[] new_hours_done = request.getParameterValues("entry-hours-done");
			String[] new_priority = request.getParameterValues("entry-priority");
			String[] new_owner = request.getParameterValues("entry-owner");
			String[] new_notes = request.getParameterValues("entry-notes");
			String[] new_status = request.getParameterValues("entry-status");
			String[] backlog_story = request.getParameterValues("backlog-story");
			String[] backlog_hours = request.getParameterValues("backlog-hours");
			String[] backlog_hours_done = request.getParameterValues("backlog-hours-done");
			String[] backlog_priority = request.getParameterValues("backlog-priority");
			String[] backlog_owner = request.getParameterValues("backlog-owner");
			String[] backlog_notes = request.getParameterValues("backlog-notes");
			String[] backlog_status = request.getParameterValues("backlog-status");

			String dueDate = request.getParameter("dueDate");
			String startDate = request.getParameter("startDate");

			ArrayList<String[]> inputs = new ArrayList<String[]>();
			ArrayList<String[]> toUpdate = new ArrayList<String[]>();
			ArrayList<String[]> datesHours = new ArrayList<String[]>();

			datesHours.add(dayHours);
			datesHours.add(dates);
			datesHours.add(hoursid);

			inputs.add(new_story);
			inputs.add(new_hours);
			inputs.add(new_hours_done);
			inputs.add(new_priority);
			inputs.add(new_owner);
			inputs.add(new_notes);
			inputs.add(new_status);

			toUpdate.add(backlog_story);
			toUpdate.add(backlog_hours);
			toUpdate.add(backlog_hours_done);
			toUpdate.add(backlog_priority);
			toUpdate.add(backlog_owner);
			toUpdate.add(backlog_notes);
			toUpdate.add(backlog_status);

			Sprint s = new Sprint();
			int sprintID = -1;

			try {
				sprintID = s.getSprintID(Integer.parseInt(projectID), sprintName);
				s.setDueDate(dueDate, String.valueOf(sprintID));
				s.setStartDate(startDate, String.valueOf(sprintID));
				s.updateStory(toUpdate, current_user);
				s.insertStory(inputs, String.valueOf(sprintID), projectID, sprintName);
				s.deleteEmptyRowsFromDB(projectID);
			} catch (NumberFormatException e) {
				e.printStackTrace();
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			}

			session.setAttribute("status", "saved");
			response.sendRedirect(request.getContextPath() + "/Display_Sprint_Controller");
		}
	}
}
