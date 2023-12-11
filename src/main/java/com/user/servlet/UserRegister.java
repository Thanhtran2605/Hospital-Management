package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.db.DBConnection;
import com.entities.User;

@WebServlet(urlPatterns = {"/user_register"})
public class UserRegister extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		try {
			String fullName = req.getParameter("fullname");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			// Luu tru gia tri tu form vao user
			User user = new User(fullName, email, password);
			
			// Thuc hien ket noi Database
			UserDao userDao = new UserDao();
			
			HttpSession session = req.getSession();
			
			// Thuc hien dang ky user
			boolean reg = userDao.register(user);
			
			if (reg) {
				session.setAttribute("successMsg", "Đăng ký thành công");
				resp.sendRedirect("signup.jsp");
			} else {
				session.setAttribute("errorMsg", "Đăng ký thất bại");
				resp.sendRedirect("signup.jsp");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
}
