<%@page import="com.entities.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecalistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Chỉnh sửa thông tin bác sĩ</title>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<link rel="stylesheet" href="../assets/css/comment.css">

</head>
<body>

	<div class="page-wrapper">
		<!-- header -->
		<header class="header">

			<!--  Link navbar -->
			<%@include file="navbar.jsp"%>

			<div class="element-one">
				<img src="../assets/images/element-img-1.png" alt="">
			</div>

			<div class="containers">
				<span class="big-circle"></span> <img src="img/shape.png"
					class="square" alt="" />
				<div class="form">
					<div class="contact-info">
						<!-- <h3 class="title">Bình luận</h3> -->
						<p class="text">Thay đổi thông tin cá nhân thực hiện bằng cách
							điền vào biểu mẫu</p>

						<div class="info">
							<div class="information">
								<!-- <img src="img/location.png" class="icon" alt="" /> -->
								<p>2912 Ngũ Hành Sơn, Đà Nẵng</p>
							</div>
							<div class="information">
								<!-- <img src="img/email.png" class="icon" alt="" /> -->
								<p>goldenhealth@gmail.com</p>
							</div>
							<div class="information">
								<!-- <img src="img/phone.png" class="icon" alt="" /> -->
								<p>(+84)865 578 773</p>
							</div>
						</div>

					</div>

					<!-- Get Doctor by Id -->
					<%
					int id = Integer.parseInt(request.getParameter("id"));
					DoctorDao doctorDao = new DoctorDao();
					Doctor doctor = doctorDao.getDoctorById(id);
					%>


					<div class="contact-form">
						<span class="circle one"></span> <span class="circle two"></span>

						<!-- Message When Logout Successfully  -->
						<c:if test="${not empty successMsgD}">
							<p class="show-message-success">${successMsgD }</p>
							<c:remove var="successMsgD" scope="session" />
						</c:if>

						<!-- Message When Login Error  -->
						<c:if test="${not empty errorMsgD}">
							<p class="show-message-error">${errorMsgD }</p>
							<c:remove var="errorMsgD" scope="session" />
						</c:if>

						<form action="../update_doctor" method="post">
							<h3 class="title">THAY ĐỔI THÔNG TIN</h3>
							<div class="input-containers">
								<span>Họ và tên</span> <input type="text"
									value="<%=doctor.getFullName()%>" required class="input"
									name="fullname">
							</div>
							<div class="input-containers">
								<span>Ngày sinh</span> <input type="date" required name="dob"
									value="<%=doctor.getDateOfBirth()%>" class="input">
							</div>
							<div class="input-containers">
								<span>Trình độ chuyên môn</span> <input type="text" required
									name="qualification" value="<%=doctor.getQualification()%>"
									class="input">
							</div>
							<div class="input-containers">
								<span>Chuyên gia</span> <select name="spec" required
									class="input">

									<option selected><%=doctor.getSpecialist()%></option>

									<option disabled value>--Lựa chọn chuyên môn--</option>

									<%
									SpecalistDao dao = new SpecalistDao();
									List<Specalist> specalists = dao.getAllSpecalist();
									for (Specalist spec : specalists) {
									%>
									<option>
										<%=spec.getSpecalistName()%>
									</option>
									<%
									}
									%>

								</select>
							</div>
							<div class="input-containers">
								<span>Email</span> <input type="email" required name="email"
									class="input" value="<%=doctor.getEmail()%>">
							</div>
							<div class="input-containers">
								<span>Điện thoại</span> <input type="number" maxlength="10"
									required name="mobno" class="input"
									value="<%=doctor.getMobNo()%>">
							</div>

							<div class="input-containers">
								<span>Mật khẩu</span> <input type="text" required
									name="password" class="input" value="<%=doctor.getPassword()%>">
							</div>

							<!-- Dòng này để lấy id từ UpdateDoctor bằng int id = Integer.getInteger(req.getParameter("id")); -->
							<input type="hidden" name="id" value="<%=doctor.getId()%>">

							<input type="submit" value="Cập nhật" class="btn" />
						</form>
					</div>
				</div>
			</div>



		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>

</body>
</html>