<%@page import="com.dao.DoctorDao"%>
<%@page import="javax.print.Doc"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Quản trị viên</title>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<link rel="stylesheet" href="../assets/css/modal.css">

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>


	<!-- Ensure if not exist admin, default login page. -->
	<c:if test="${empty adminObj}">
		<c:redirect url="../login_admin.jsp">
		</c:redirect>
	</c:if>

	<!-- Count -->
	<%
	DoctorDao doctorDao = new DoctorDao();
	%>

	<div class="page-wrapper">
		<!-- header -->
		<header class="header">

			<!--  Link navbar -->
			<%@include file="navbar.jsp"%>

			<div class="element-one">
				<img src="../assets/images/element-img-1.png" alt="">
			</div>

			<main>
				<section class="sc-services">
					<div class="services-shape">
						<img src="../assets/images/curve-shape-1.png" alt="">
					</div>
					<div class="container">
						<div class="services-content">
							<div class="title-box text-center">
								<div class="content-wrapper">
									<h3 class="title-box-name">Bảng điều khiển Bác sĩ</h3>
								</div>
							</div>

							<div class="services-list">
								<div class="services-item">
									<div class="item-icon">
										<i class="fa-solid fa-user-doctor"
											style="transform: scale(3);"></i>
									</div>
									<h5 class="item-title fw-7">Bác sĩ</h5>
									<p class="text"><%=doctorDao.countDoctor()%></p>
								</div>

								<div class="services-item">
									<div class="item-icon">
										<i class="fa-solid fa-user" style="transform: scale(3);"></i>
									</div>
									<h5 class="item-title fw-7">Bệnh nhân</h5>
									<p class="text"><%=doctorDao.countUser()%></p>
								</div>

								<div class="services-item">
									<div class="item-icon">
										<i class="fa-regular fa-calendar-check"
											style="transform: scale(3);"></i>
									</div>
									<h5 class="item-title fw-7">Tổng số đặt lịch</h5>
									<p class="text"><%=doctorDao.countAppointment()%></p>
								</div>

								<div id="login-show" class="services-item">
									<div class="item-icon">
										<i class="fa-regular fa-newspaper"
											style="transform: scale(3);"></i>
									</div>
									<h5 class="item-title fw-7">Chuyên gia</h5>
									<p class="text"><%=doctorDao.countSpecalist()%></p>
								</div>

							</div>
						</div>
				</section>
			</main>

		</header>
	</div>

	<div id="login-modal">
		<div class="modal">
			<div class="top-form">
				<div class="close-modal">&#10006;</div>
			</div>
			<div class="login-form">
				<h2>Thêm chuyên gia</h2>
				<form action="../add_specialist" method="post">
					<input class="form-control" type="text" name="specName" required
						placeholder="Nhập vào tên chuyên gia">
					<button type="submit" class="submit-btn">Thêm</button>
				</form>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function() {

			$('#login-show').click(function() {
				$('#login-modal').fadeIn().css("display", "flex");
			});

			$('.close-modal').click(function() {
				$('#login-modal').fadeOut();
			});
		});
	</script>

	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>

</body>
</html>