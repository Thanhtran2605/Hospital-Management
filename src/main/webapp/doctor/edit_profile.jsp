<%@page import="com.entities.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entities.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecalistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi thông tin</title>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<link rel="stylesheet" href="../assets/css/comment.css">

<style>
@media ( max-width : 1600px) {
	.form {
		width: 100vw;
	}
}

@media ( max-width : 1400px) {
	.form {
		width: 100%;
	}
}
</style>

</head>
<body>

	<!-- Ensure if not exist doctor, default login page. -->
	<c:if test="${empty doctorObj}">
		<c:redirect url="../login_doctor.jsp">
		</c:redirect>
	</c:if>

	<div class="page-wrapper">
		<!-- header -->
		<header class="header">

			<!--  Link navbar -->
			<%@include file="navbar.jsp"%>

			<div class="element-one">
				<img src="../assets/images/element-img-1.png" alt="">
			</div>

			<div class="banner">
				<div class="container">
					<div class="banner-content">


						<!-- Doctor Login -->
						<div class="banner-right">
							<div class="box content-wrapper">
								<span class="borderLine"></span>
								<form action="../doctor_chpassword" method="post">
									<h2>Thay đổi mật khẩu</h2>

									<!-- Message When Logout Successfully  -->
									<c:if test="${not empty successMsg}">
										<p class="show-message-success" style="color: green;">${successMsg }</p>
										<c:remove var="successMsg" scope="session" />
									</c:if>

									<!-- Message When Login Error  -->
									<c:if test="${not empty errorMsg}">
										<p class="show-message-error" style="color: red;">${errorMsg }</p>
										<c:remove var="errorMsg" scope="session" />
									</c:if>


									<div class="inputBox">

										<input type="text" name="newPassword" required="required">
										<span>Mật khẩu mới</span> <i></i>
									</div>

									<div class="inputBox">
										<input type="text" name="oldPassword" required="required">
										<span>Mật khẩu cũ</span> <i></i>
									</div>

									<input type="hidden" name="uid" value="${doctorObj.id}">

									<input type="submit" value="Cập nhật" style="color: white;">
								</form>
							</div>
						</div>

						<div
							class="banner-left d-flex align-items-center justify-content-end">

							<div class="containers">
								<span class="big-circle"></span> <img src="img/shape.png"
									class="square" alt="" />
								<div class="form">
									<div class="contact-info">
										<!-- <h3 class="title">Bình luận</h3> -->
										<p class="text">Thay đổi thông tin cá nhân thực hiện bằng
											cách điền vào biểu mẫu</p>

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

									<div class="contact-form">
										<span class="circle one"></span> <span class="circle two"></span>

										<!-- Message When Logout Successfully  -->
										<c:if test="${not empty successMsgD}">
											<p class="show-message-success" style="color: green;">${successMsgD }</p>
											<c:remove var="successMsgD" scope="session" />
										</c:if>

										<!-- Message When Login Error  -->
										<c:if test="${not empty errorMsgD}">
											<p class="show-message-error" style="color: red;">${errorMsgD }</p>
											<c:remove var="errorMsgD" scope="session" />
										</c:if>


										<form action="../doctor_updateProfile" method="post">
											<h3 class="title">THAY ĐỔI THÔNG TIN</h3>
											<div class="input-containers">
												<span>Họ và tên</span> <input type="text"
													value="${doctorObj.fullName}" required class="input"
													name="fullname">
											</div>
											<div class="input-containers">
												<span>Ngày sinh</span> <input type="date" required
													name="dob" value="${doctorObj.dateOfBirth}" class="input">
											</div>
											<div class="input-containers">
												<span>Trình độ chuyên môn</span> <input type="text" required
													name="qualification" value="${doctorObj.qualification}"
													class="input">
											</div>
											<div class="input-containers">
												<span>Chuyên gia</span> <select name="spec" required
													class="input">
													<option>${doctorObj.specialist}</option>

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
													class="input" value="${doctorObj.email}">
											</div>
											<div class="input-containers">
												<span>Điện thoại</span> <input type="number" maxlength="10"
													required name="mobno" class="input"
													value="${doctorObj.mobNo}">
											</div>

											<input type="hidden" name="id" value="${doctorObj.id}">

											<input type="submit" value="Cập nhật" class="btn" />
										</form>
									</div>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>

		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>

</body>
</html>