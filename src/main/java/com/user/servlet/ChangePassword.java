package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;

@WebServlet(urlPatterns = { "/change_password" })
public class ChangePassword extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		int uid = Integer.parseInt(req.getParameter("uid"));
		String oldPassword = req.getParameter("oldPassword");
		String newPassword = req.getParameter("newPassword");

		UserDao dao = new UserDao();

		HttpSession session = req.getSession();

		if (dao.checkOldPassword(uid, oldPassword)) {

			if (dao.changePassword(uid, newPassword)) {
				session.setAttribute("successMsg", "Thay đổi mật khẩu thành công");
				resp.sendRedirect("change_password.jsp");

			} else {
				session.setAttribute("errorMsg", "Lỗi từ phía Server");
				resp.sendRedirect("change_password.jsp");
			}

		} else {
			session.setAttribute("errorMsg", "Mật khẩu cũ không chính xác");
			resp.sendRedirect("change_password.jsp");

		}
	}

}
