package com.doctor.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AppointmentDao;

@WebServlet(urlPatterns = {"/update_status"})
public class UpdateStatus extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try {
			int id = Integer.parseInt(req.getParameter("id"));
			int did = Integer.parseInt(req.getParameter("did"));
			String comment = req.getParameter("comment");
			
			AppointmentDao dao = new AppointmentDao();
			
			HttpSession session = req.getSession();
			
			if (dao.updateCommentStatus(id, did, comment)) {
				session.setAttribute("successMsg", "Bình luận đã được cập nhật");
				resp.sendRedirect("doctor/patient.jsp");
			} else {
				session.setAttribute("errorMsg", "Không thành công");
				resp.sendRedirect("doctor/patient.jsp");
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
