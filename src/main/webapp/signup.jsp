<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đăng ký người dùng</title>

<!-- Link icon favicon -->
<link rel="icon" href="assets/images/logo.png">

<!-- Link library -->
<%@include file="component/css.jsp"%>

<style type="text/css">
.box {
	height: 500px;
}
</style>

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

			<div class="banner">
				<div class="container">
					<div class="banner-content">

						<!-- Doctor Login -->
						<div class="banner-right">
							<div class="box content-wrapper">
								<div class="box">
									<span class="borderLine"></span>
									<form action="user_register" method="post">
										<h2>Đăng ký Người dùng</h2>

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

											<input type="fullname" required="required" name="fullname">
											<span>Họ và tên </span> <i></i>
										</div>

										<div class="inputBox">

											<input type="email" required="required" name="email">
											<span>Email </span> <i></i>
										</div>

										<div class="inputBox">
											<input type="password" required="required" name="password">
											<span>Mật khẩu</span> <i></i>
										</div>

										<div class="links">
											<a href="login_user.jsp">Đăng nhập </a>
										</div>

										<input type="submit" value="Đăng ký">
									</form>
								</div>
							</div>
						</div>

						<div
							class="banner-left d-flex align-items-center justify-content-end"
							style="transform: scale(1.4);">
							<img src="assets/images/download-image.png" alt="Poster">
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="virtual_assistant.jsp"%>

</body>
</html>