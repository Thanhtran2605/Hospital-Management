<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Thay đổi mật khẩu</title>

<!-- Link icon favicon -->
<link rel="icon" href="assets/images/logo.png">

<!-- Link library -->
<%@include file="component/css.jsp"%>

</head>
<body>


	<!-- Ensure if not exist user, default login page. -->
	<c:if test="${empty userObj}">
		<c:redirect url="login_doctor.jsp">
		</c:redirect>
	</c:if>

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
								<span class="borderLine"></span>
								<form action="change_password" method="post">
									<h2>Thay đổi mật khẩu</h2>

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

										<input type="password" name="newPassword" required="required">
										<span>Mật khẩu mới</span> <i></i>
									</div>

									<div class="inputBox">
										<input type="password" name="oldPassword" required="required">
										<span>Mật khẩu cũ</span> <i></i>
									</div>

									<input type="hidden" name="uid" value="${userObj.id}">

									<input type="submit" value="Thay đổi">
								</form>
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