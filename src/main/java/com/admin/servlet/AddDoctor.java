package com.admin.servlet;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.DoctorDao;
import com.entities.Doctor;

@WebServlet(urlPatterns = { "/add_doctor" })
@MultipartConfig

public class AddDoctor extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		try {

			String fullName = req.getParameter("fullname");
			String dateOfBirth = req.getParameter("dob");
			String qualification = req.getParameter("qualification");

			String spec = req.getParameter("spec");

			Part filePart = req.getPart("imageFile");
			String fileName = filePart.getSubmittedFileName();
			String imagePath = "images/" + fileName;

			// Đường dẫn thư mục lưu trữ ảnh trong dự án. Lưu trữ ảnh vào images file.
			String projectPath = System.getProperty("user.home");
			String savePath = projectPath + "/eclipse-workspace/HospitalSystem/src/main/webapp/assets/" + imagePath;

			try (InputStream inputStream = filePart.getInputStream();
					FileOutputStream outputStream = new FileOutputStream(savePath)) {

				// Đọc dữ liệu từ InputStream và ghi vào tệp ảnh
				byte[] buffer = new byte[8192];
				int bytesRead;
				while ((bytesRead = inputStream.read(buffer, 0, 8192)) != -1) {
					outputStream.write(buffer, 0, bytesRead);
				}

			} catch (IOException e) {
				e.printStackTrace();
			}

			String email = req.getParameter("email");
			String mobno = req.getParameter("mobno");
			String password = req.getParameter("password");

			Doctor doctor = new Doctor(fullName, dateOfBirth, qualification, imagePath, spec, email, mobno, password);

			DoctorDao dao = new DoctorDao();

			HttpSession session = req.getSession();

			if (dao.registerDoctor(doctor)) {
				session.setAttribute("successMsg", "Thêm bác sĩ thành công");
				resp.sendRedirect("admin/doctor.jsp");
			} else {
				session.setAttribute("errorMsg", "Thêm bác sĩ thất bại");
				resp.sendRedirect("admin/doctor.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
