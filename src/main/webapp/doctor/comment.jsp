<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entities.Appointment"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bình luận</title>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<link rel="stylesheet" href="../assets/css/comment-doc.css">

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
			int id = Integer.parseInt(request.getParameter("id"));
			AppointmentDao dao = new AppointmentDao();
			Appointment appointment = dao.getAppointmentById(id);
			%>

			<div class="contact-form">
				<h1>GHI CHÚ</h1>
				<div class="containers">
					<div class="main">
						<div class="content">
							<h2>Để lại ghi chú cho bệnh nhân</h2>
							<form action="../update_status" method="post">
								<span class="span">Tên bệnh nhân</span> <input type="text"
									readonly value="<%=appointment.getFullName()%>" class="input">
								<span>Tuổi</span> <input type="text" readonly
									value="<%=appointment.getAge()%>" class="input"> <span>Điện
									thoại</span> <input type="text" readonly
									value="<%=appointment.getPhoneNum()%>" class="input"> <span>Chuẩn
									đoán</span> <input type="text" readonly
									value="<%=appointment.getDiseases()%>" class="input"> <span>Bình
									luận</span>
								<textarea required name="comment" class="input" row="3"></textarea>

								<input type="hidden" name="id" value="<%=appointment.getId()%>">
								<input type="hidden" name="did"
									value="<%=appointment.getDoctorId()%>"> <input
									type="submit" value="Gửi đi" class="btn" />
							</form>
						</div>
						<div class="form-img">
							<img src="../assets/images/curve-shape-2.png" alt="">
						</div>
					</div>
				</div>
			</div>
		</header>
	</div>
	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>
</body>
</html>