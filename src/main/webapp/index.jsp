<%@page import="com.entities.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Golden Health</title>

<!-- Link icon favicon -->
<link rel="icon" href="assets/images/logo.png">

<!-- Link library and css -->
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

			<div class="banner">
				<div class="container">
					<div class="banner-content">
						<div class="banner-left">
							<div class="content-wrapper">
								<h1 class="banner-title">
									Chúng tôi <br> quan tâm sức khỏe của bạn
								</h1>
								<p class="text text-white">
									Nền tảng y tế, sức khỏe toàn diện. Chúng tôi luôn bên cạnh bảo
									vệ sức khỏe của bạn. <br> Đặt lịch khám ngay tại website.
								</p>
								<a href="user_appointment.jsp" class="btn btn-secondary">Đặt
									lịch khám</a>
							</div>
						</div>

						<div
							class="banner-right d-flex align-items-center justify-content-end"
							style="transform: scale(1.1);">
							<img src="assets/images/poster.png" alt="Poster">
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>

	<!-- end of header -->

	<main>
		<section class="sc-services">
			<div class="services-shape">
				<img src="assets/images/curve-shape-1.png" alt="">
			</div>
			<div class="container">
				<div class="services-content">
					<div class="title-box text-center">
						<div class="content-wrapper">
							<h3 class="title-box-name">Đội ngũ bác sĩ</h3>
							<div class="title-separator mx-auto"></div>
							<p class="text title-box-text">Chúng tôi cung cấp những gì
								tốt nhất sự lựa chọn giành cho bạn. Điều chỉnh nó theo nhu cầu
								sức khỏe của bạn và đảm bảo bạn được điều trị với các bác sĩ có
								trình độ cao của chúng tôi.</p>
						</div>
					</div>
					<div class="services-list">
						<%
						DoctorDao doctorDao = new DoctorDao();
						List<Doctor> doctors = doctorDao.getAllDoctor();

						for (Doctor doctor : doctors) {
						%>
						<div class="services-item">


							<div class="item-icon">
								<img src="assets/<%=doctor.getImageFile()%>" alt="service icon"
									style="height: 250px;">
							</div>

							<h5 class="item-title fw-7"><%=doctor.getFullName()%></h5>
							<p class="text"><%=doctor.getSpecialist()%></p>
						</div>

						<%
						}
						%>
					</div>
				</div>
			</div>
			</div>
		</section>

		<section class="sc-grid sc-grid-one">
			<div class="container">
				<div class="grid-content d-grid align-items-center">
					<div class="grid-img">
						<img src="assets/images/health-care-img.png" alt="">
					</div>
					<div class="grid-text">
						<div class="content-wrapper text-start">
							<div class="title-box">
								<h3 class="title-box-name text-white">Các nhà cung cấp dịch
									vụ chăm sóc sức khỏe hàng đầu</h3>
								<div class="title-separator mx-auto"></div>
							</div>

							<p class="text title-box-text text-white">Golden Healthy cung
								cấp dịch vụ chăm sóc sức khỏe tiến bộ và giá cả phải chăng, có
								thể truy cập được trên thiết bị di động và trực tuyến cho mọi
								người. Đối với chúng tôi, đó không chỉ là công việc. Chúng tôi
								tự hào về các giải pháp chúng tôi cung cấp.</p>
							<!-- <button type="button" class="btn btn-white-outline">Learn
									more</button> -->
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- Footer -->
		<footer class="footer">
			<div class="container">
				<div class="footer-content">
					<div class="footer-list d-grid text-white">
						<div class="footer-item">
							<a href="#" class="navbar-brand d-flex align-items-center"> <span
								class="brand-shape d-inline-block text-white"> <img
									src="assets/images/logo.png" alt="Logo">
							</span> <span class="brand-text fw-7">Golden Healthy</span>
							</a>
							<p class="text-white">Cung cấp dịch vụ chăm sóc sức khỏe hàng
								đầu. Sức khỏe của bạn là ưu tiên của chúng tôi.</p>
							<p class="text-white copyright-text">&copy; 2023 Golden
								Healdhy.</p>
						</div>

						<div class="footer-item">
							<h3 class="footer-item-title">Văn phòng</h3>
							<ul class="footer-links">
								<li>Số 05, đường Văn Nam, phường 16</li>
								<li>Lô B4/D21, Khu đồ thị mới</li>
							</ul>
						</div>
					</div>
				</div>
			</div>

			<div class="footer-element-1">
				<img src="assets/images/element-img-4.png" alt="">
			</div>
			<div class="footer-element-2">
				<img src="assets/images/element-img-5.png" alt="">
			</div>
		</footer>
	</main>

	<!-- Virtual Assistant  -->
	<%@include file="virtual_assistant.jsp"%>

</body>
</html>

