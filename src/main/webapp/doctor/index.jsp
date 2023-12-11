<%@page import="com.entities.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bác sĩ</title>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<style>
.sc-services {
	padding-top: 0px;
}

.services-item {
	width: calc(48.3333% - 37px);
}

.services-item .item-title {
	margin-top: 0px;
}

.item-title {
	color: #777;
	text-align: center;
}

.item-icon {
	display: flex;
	align-items: center;
	justify-content: center;
	height: 120px;
}

.item-icon i {
	color: #333;
	transform: scale(3);
}

.text {
	text-align: center;
	color: #458ff6;
	font-weight: bold;
	font-size: 32px;
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

			<%
			Doctor doctor = (Doctor) session.getAttribute("doctorObj");
			DoctorDao dao = new DoctorDao();
			%>


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
									<p class="text"><%=dao.countDoctor()%></p>
								</div>

								<div class="services-item">
									<div class="item-icon">
										<i class="fa-solid fa-calendar-check"></i>
									</div>
									<h5 class="item-title fw-7">Tổng số đặt lịch</h5>
									<p class="text"><%=dao.countAppointmentByDoctorId(doctor.getId())%></p>
								</div>
							</div>
						</div>
				</section>
			</main>

		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>

</body>
</html>