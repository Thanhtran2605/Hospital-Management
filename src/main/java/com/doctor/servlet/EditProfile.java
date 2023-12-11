package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.DoctorDao;
import com.entities.Doctor;

@WebServlet("/doctor_updateProfile")
public class EditProfile extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try {

			String fullName = req.getParameter("fullname");
			String dateOfBirth = req.getParameter("dob");
			String qualification = req.getParameter("qualification");

			String spec = req.getParameter("spec");
			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");

			int id = Integer.parseInt(req.getParameter("id"));

			Doctor doctor = new Doctor(id, fullName, dateOfBirth, qualification, spec, email, mobno, "");

			DoctorDao dao = new DoctorDao();

			HttpSession session = req.getSession();

			if (dao.editDoctorProfile(doctor)) {
				Doctor updateDoctor = dao.getDoctorById(id);
				session.setAttribute("successMsgD", "Cập nhật thông tin thành công");
				session.setAttribute("doctorObj", updateDoctor);
				resp.sendRedirect("doctor/edit_profile.jsp");
			} else {
				session.setAttribute("errorMsgD", "Cập nhật thông tin không thành công");
				resp.sendRedirect("doctor/edit_profile.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
