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
<title>Quản lý bác sĩ</title>

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
						<p class="text">Thêm bác sĩ bằng cách điền vào biểu mẫu</p>

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

						<c:if test="${not empty successMsg}">
							<p class="show-message-success">${successMsg }</p>
							<c:remove var="successMsg" scope="session" />
						</c:if>

						<c:if test="${not empty errorMsg}">
							<p class="show-message-error">${errorMsg }</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>

						<form action="../add_doctor" method="post"
							enctype="multipart/form-data">
							<h3 class="title">THÊM BÁC SĨ</h3>
							<div class="input-containers">
								<span>Họ và tên</span> <input type="text" required class="input"
									name="fullname">
							</div>
							<div class="input-containers">
								<span>Ngày sinh</span> <input type="date" required name="dob"
									class="input">
							</div>
							<div class="input-containers">
								<span>Trình độ chuyên môn</span> <input type="text" required
									name="qualification" class="input">
							</div>
							<div class="input-containers">
								<span>Ảnh</span><input type="file" name="imageFile"
									accept="image/*" class="input" required>
							</div>
							<div class="input-containers">
								<span>Chuyên gia</span> <select name="spec" required
									class="input">
									<option disabled selected value>--Lựa chọn chuyên
										môn--</option>

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
									class="input">
							</div>
							<div class="input-containers">
								<span>Điện thoại</span> <input type="number" maxlength="10"
									required required name="mobno" class="input">
							</div>
							<div class="input-containers">
								<span>Mật khẩu</span> <input required name="password"
									type="password" class="input">
							</div>

							<input type="submit" value="Thêm" class="btn" />
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