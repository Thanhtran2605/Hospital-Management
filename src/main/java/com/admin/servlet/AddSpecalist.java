package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.SpecalistDao;
import com.entities.User;

@WebServlet(urlPatterns = {"/add_specialist"})
public class AddSpecalist extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String specName = req.getParameter("specName");
		
		SpecalistDao dao = new SpecalistDao();
		boolean reg = dao.addSpecalist(specName);
		
		HttpSession session = req.getSession();
		
		if (reg) {
			session.setAttribute("successMsg", "Thêm chuyên môn thành công");
			resp.sendRedirect("admin/index.jsp");
		} else {
			session.setAttribute("errorMsg", "Thêm chuyên môn thất bại");
			resp.sendRedirect("admin/index.jsp");
		}
		
	}
	
}
