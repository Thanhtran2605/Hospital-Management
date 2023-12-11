package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.AdminDao;
import com.entities.Admin;
import com.entities.User;

@WebServlet(urlPatterns = {"/admin_login"})
public class AdminLogin extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			HttpSession session = req.getSession();
			
			AdminDao adminDao = new AdminDao();
			Admin admin = adminDao.login(email, password);

			if (admin != null) {
				session.setAttribute("adminObj", new User());
				resp.sendRedirect("admin/index.jsp");
			} else {
				session.setAttribute("errorMsg", "Đăng nhập thất bại");
				resp.sendRedirect("login_admin.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
