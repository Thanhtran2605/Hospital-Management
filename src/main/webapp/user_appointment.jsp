<%@page import="com.entities.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đặt lịch khám người dùng</title>

<!-- Link icon favicon -->
<link rel="icon" href="assets/images/logo.png">

<!-- Link file css -->
<%@include file="component/css.jsp"%>

<!-- Link css -->
<link type="text/css" rel="stylesheet"
	href="assets/css/appointment_form.css">

</head>
<body>

	<!--  Link navbar -->
	<%@include file="component/navbar.jsp"%>

	<div class="element-one">
		<img src="assets/images/element-img-1.png" alt="">
	</div>

	<div class="bound">

		<div class="containers">

			<div class="contactInfo" style="margin-top: 100px;">
				<div>
					<h2>ĐẶT LỊCH KHÁM</h2>
					<ul class="info">
						<li><span> <img src="assets/images/location.png">
						</span> <span> 2912 Ngũ Hành Sơn, <br> Đà Nẵng
						</span></li>

						<li><span><img src="assets/images/mail.png"></span> <span>goldenhealth@gmail.com</span>
						</li>
						<li><span><img src="assets/images/call.png"></span> <span>(+84)865
								578 773</span></li>
					</ul>
				</div>

			</div>
			<div class="contactForm">
				<h2>Điền thông tin của bạn phía dưới</h2>


				<c:if test="${not empty successMsg}">
					<p class="show-message-success">${successMsg }</p>
					<c:remove var="successMsg" scope="session" />
				</c:if>


				<c:if test="${not empty errorMsg}">
					<p class="show-message-error">${errorMsg }</p>
					<c:remove var="errorMsg" scope="session" />
				</c:if>

				<form class="formBox" action="appointment" method="post">

					<!-- Lấy ra userId thông qua userObj để gửi qua AppointmentServlet.java -->
					<input type="hidden" name="userid" value="${userObj.id }">

					<div class="inputBox w50">
						<input type="text" name="fullname" required> <span>Họ
							và tên</span>
					</div>
					<div class="inputBox w50">
						<select class="form-control" name="gender" required>
							<option disabled selected value></option>
							<option value="Nam">Nam</option>
							<option value="Nữ">Nữ</option>
						</select><span>Giới tính</span>
					</div>


					<div class="inputBox w50">
						<input type="number" min="1" max="100" name="age" required>
						<span>Tuổi</span>
					</div>

					<div class="inputBox w50">
						<input type="date" required name="appoint_date">
						<!-- <span>Ngày đặt hẹn</span> -->
					</div>

					<div class="inputBox w50">
						<input required type="email" name="email"> <span>Email</span>
					</div>

					<div class="inputBox w50">
						<input maxlength="10" required type="number" name="phno">
						<span>Số điện thoại</span>
					</div>

					<div class="inputBox w50">
						<input required type="text" name="diseases"> <span>Bệnh
							tật</span>
					</div>

					<div class="inputBox w50">
						<!-- name="doct" trong select lấy ra id của của bác sĩ khi chọn vào từng option  -->
						<select required name="doct">
							<option disabled selected value></option>

							<!-- Lấy danh sách tên Doctor thông qua getAllDoctor() -->
							<%
							DoctorDao doctorDao = new DoctorDao();
							List<Doctor> doctors = doctorDao.getAllDoctor();
							for (Doctor doctor : doctors) {
							%>
							<option value="<%=doctor.getId()%>"><%=doctor.getFullName()%>
								(<%=doctor.getSpecialist()%>)
							</option>

							<%
							}
							%>
						</select> <span>Bác sĩ</span>
					</div>

					<div class="inputBox w100">
						<textarea required name="address"></textarea>
						<span>Địa chỉ liên lạc</span>
					</div>

					<!-- Nếu mà không tồn tại đã đăng nhập userObj thì quay về trang login bằng nút submit khi nhấn thẻ a -->
					<c:if test="${empty userObj }">
						<div class="inputBox w100">
							<a href="login_user.jsp" class="submit">Đặt lịch</a>
						</div>
					</c:if>

					<!-- Nếu tồn tại userObj khi đăng nhập thì gửi thông tin -->
					<c:if test="${not empty userObj }">
						<div class="inputBox w100">
							<button class="submit">Đặt lịch</button>
						</div>
					</c:if>

				</form>

			</div>
		</div>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="virtual_assistant.jsp"%>

</body>

</html>