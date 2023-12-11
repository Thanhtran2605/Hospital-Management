package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;
import com.entities.Appointment;

@WebServlet(urlPatterns = { "/appointment" })
public class AppointmentServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		int userId = Integer.parseInt(req.getParameter("userid"));
		String fullName = req.getParameter("fullname");
		String gender = req.getParameter("gender");
		String age = req.getParameter("age");
		String appointDate = req.getParameter("appoint_date");
		String email = req.getParameter("email");
		String phno = req.getParameter("phno");
		String diseases = req.getParameter("diseases");
		int doctorId = Integer.parseInt(req.getParameter("doct"));
		String address = req.getParameter("address");

		Appointment app = new Appointment(doctorId, userId, fullName, gender, age, appointDate, email, phno, diseases,
				doctorId, address, "Chưa xử lý");

		AppointmentDao dao = new AppointmentDao();

		HttpSession session = req.getSession();

		if (dao.addAppointment(app)) {
			session.setAttribute("successMsg", "Đặt lịch khám thành công");
			resp.sendRedirect("user_appointment.jsp");
		} else {
			session.setAttribute("errorMsg", "Đặt lịch khám thất bại");
			resp.sendRedirect("user_appointment.jsp");
		}

	}

}
