<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<nav class="navbar">
	<div class="container">
		<div
			class="navbar-content d-flex justify-content-between align-items-center">
			<div
				class="brand-and-toggler d-flex align-items-center justify-content-between">
				<a href="index.jsp" class="navbar-brand d-flex align-items-center">
					<span class="brand-shape d-inline-block text-white"> <img
						src="../assets/images/logo.png" alt="Logo">
				</span> <span class="brand-text fw-7">SỨC KHỎE VÀNG</span>
				</a>
				<button type="button" class="d-none navbar-show-btn">
					<i class="fas fa-bars"></i>
				</button>
			</div>

			<div class="navbar-box">
				<button type="button" class="navbar-hide-btn">
					<i class="fas fa-times"></i>
				</button>

				<ul class="navbar-nav d-flex align-items-center">

					<li class="nav-item"><a href="index.jsp"
						class="nav-link text-white text-nowrap">Trang chủ</a></li>
					<li class="nav-item"><a href="doctor.jsp"
						class="nav-link text-white text-nowrap">Bác sĩ</a></li>
					<li class="nav-item"><a href="view_doctor.jsp"
						class="nav-link text-white text-nowrap">Xem bác sĩ</a></li>
					<li class="nav-item"><a href="patient.jsp"
						class="nav-link text-white text-nowrap">Bệnh nhân</a></li>
					<li class="nav-item"><a href="../admin_logout"
						class="nav-link text-white text-nowrap">Đăng xuất</a></li>

				</ul>
			</div>
		</div>
	</div>
</nav>
