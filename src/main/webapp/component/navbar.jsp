<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>

<style>
/* Style The Dropdown Button */
.dropbtn {
	color: white;
	font-weight: bold;
	padding: 16px;
	font-size: 16px;
	border: none;
	cursor: pointer;
	width: 150px;
}

/* The container <div> - needed to position the dropdown content */
.dropdown {
	position: relative;
	display: inline-block;
}

/* Dropdown Content (Hidden by Default) */
.dropdown-content {
	display: none;
	position: absolute;
	background-color: #f9f9f9;
	min-width: 160px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	z-index: 1000;
}

/* Links inside the dropdown */
.dropdown-content a {
	color: black;
	padding: 12px 16px;
	text-decoration: none;
	display: block;
}

/* Change color of dropdown links on hover */
.dropdown-content a:hover {
	background-color: #f1f1f1
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
	display: block;
}

@media screen and (max-width: 992px) {
	.nav-black {
		color: #777;
	}
	.dropbtn {
		color: #777;
	}
}
</style>

<nav class="navbar">
	<div class="container">
		<div
			class="navbar-content d-flex justify-content-between align-items-center">
			<div
				class="brand-and-toggler d-flex align-items-center justify-content-between">
				<a href="index.jsp" class="navbar-brand d-flex align-items-center">
					<span class="brand-shape d-inline-block text-white"> <img
						src="assets/images/logo.png" alt="Logo">
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

				<!-- nav-active: active -->

				<ul class="navbar-nav d-flex align-items-center">
					<!-- If It's not exist Session userObj. Don't show this for user registed -->
					<c:if test="${empty userObj}">
						<li class="nav-item"><a href="index.jsp"
							class="nav-link text-white text-nowrap">Trang chủ</a></li>
						<li class="nav-item"><a href="login_doctor.jsp"
							class="nav-link text-white text-nowrap">Bác sĩ</a></li>
						<li class="nav-item"><a href="login_user.jsp"
							class="nav-link text-white text-nowrap">Người dùng</a></li>
						<li class="nav-item"><a href="user_appointment.jsp"
							class="nav-link text-white text-nowrap">Đặt lịch khám</a></li>
						<li class="nav-item"><a href="login_admin.jsp"
							class="nav-link text-white text-nowrap">Quản trị viên</a></li>
					</c:if>

					<!-- If exist Session userObj if show this for user registed -->
					<c:if test="${not empty userObj}">
						<li class="nav-item"><a href="user_appointment.jsp"
							class="nav-link text-white text-nowrap">Đặt lịch hẹn</a></li>
						<li class="nav-item"><a href="view_appointment.jsp"
							class="nav-link text-white text-nowrap">Xem lịch hẹn</a></li>

						<li class="nav-item dropdown nav-black">
							<button class="dropbtn" href="#" id="navbarDropdown"
								role="button" data-bs-toggle="dropdown" aria-expanded="false">
								<i class="fa-regular fa-user nav-black"></i> ${userObj.fullName}
							</button>
							<ul class="dropdown-content" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="change_password.jsp">Thay
										đổi mật khẩu</a></li>
								<li><hr class="dropdown-divider"></li>
								<li><a class="dropdown-item" href="user_logout">Đăng
										xuất</a></li>
							</ul>
						</li>
					</c:if>

				</ul>
			</div>
		</div>
	</div>
</nav>
