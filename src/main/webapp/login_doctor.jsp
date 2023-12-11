<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng nhập bác sĩ</title>

<!-- Link icon favicon -->
<link rel="icon" href="assets/images/logo.png">

<!-- Link library -->
<%@include file="component/css.jsp"%>

</head>
<body>
	<div class="page-wrapper">
		<!-- header -->
		<header class="header">

			<!--  Link navbar -->
			<%@include file="component/navbar.jsp"%>

			<div class="element-one">
				<img src="assets/images/element-img-1.png" alt="">
			</div>

			<!-- Doctor Login -->
			<div class="banner">
				<div class="container">
					<div class="banner-content">


						<!-- Doctor Login -->
						<div class="banner-right">
							<div class="box content-wrapper">
								< <span class="borderLine"></span>
								<form action="doctor_login" method="post">
									<h2>Đăng nhập Bác sĩ</h2>

									<!-- Message When Logout Successfully  -->
									<c:if test="${not empty successMsg}">
										<p class="show-message-success">${successMsg }</p>
										<c:remove var="successMsg" scope="session" />
									</c:if>

									<!-- Message When Login Error  -->
									<c:if test="${not empty errorMsg}">
										<p class="show-message-error">${errorMsg }</p>
										<c:remove var="errorMsg" scope="session" />
									</c:if>

									<div class="inputBox">

										<input type="email" required="required" name="email">
										<span>Email </span> <i></i>
									</div>

									<div class="inputBox">
										<input type="password" required="required" name="password">
										<span>Mật khẩu</span> <i></i>
									</div>
									<input type="submit" value="Đăng nhập">
								</form>
							</div>
						</div>

						<div
							class="banner-left d-flex align-items-center justify-content-end"
							style="transform: scale(1.4);">
							<img src="assets/images/health-care-img.png" alt="Poster">
						</div>
					</div>
				</div>
			</div>

			<!-- <div class="circle">
				<div class="dots"></div>
			</div> -->

		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="virtual_assistant.jsp"%>

</body>
</html>