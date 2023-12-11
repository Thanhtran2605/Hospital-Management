package com.admin.servlet;

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

@WebServlet(urlPatterns = { "/update_doctor" })
public class UpdateDoctor extends HttpServlet {

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
			String password = req.getParameter("password");

			int id = Integer.parseInt(req.getParameter("id"));
			
			Doctor doctor = new Doctor(id, fullName, dateOfBirth, qualification, spec, email, mobno, password);

			DoctorDao dao = new DoctorDao();

			HttpSession session = req.getSession();

			if (dao.updateDoctor(doctor)) {
				session.setAttribute("successMsg", "Cập nhật thông tin thành công");
				resp.sendRedirect("admin/view_doctor.jsp");
			} else {
				session.setAttribute("errorMsg", "Cập nhật thông tin thất bại");
				resp.sendRedirect("admin/view_doctor.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
