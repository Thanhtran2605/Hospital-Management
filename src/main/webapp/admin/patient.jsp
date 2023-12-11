<%@page import="com.entities.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="java.util.List"%>
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
<title>Xem bệnh nhân</title>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<link rel="stylesheet" href="../assets/css/view.css">

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

			<section>
				<!--for demo wrap-->
				<h1 style="font-size: 16px;">Danh sách lịch khám</h1>
				<div class="tbl-header">
					<table cellpadding="0" cellspacing="0" border="0">
						<thead>
							<tr>
								<th>#</th>

								<th>Họ và tên</th>

								<th>Giới tính</th>

								<th>Tuổi</th>

								<th>Ngày đặt lịch</th>

								<th>Email</th>

								<th>Điện thoại</th>

								<th>Chuẩn đoán</th>

								<th>Bác sĩ</th>

								<th>Trạng thái</th>

								<th>Tình trạng</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="tbl-content">
					<table cellpadding="0" cellspacing="0" border="0">
						<tbody>
							<%
							AppointmentDao dao = new AppointmentDao();
							DoctorDao doctorDao = new DoctorDao();
							List<Appointment> appointments = dao.getAllAppointment();
							for (Appointment appointment : appointments) {
								Doctor doctor = doctorDao.getDoctorById(appointment.getDoctorId());
							%>

							<tr>
								<th><%=appointment.getId()%></th>
								<td><%=appointment.getFullName()%></td>
								<td><%=appointment.getGender()%></td>
								<td><%=appointment.getAge()%></td>
								<td><%=appointment.getAppointDate()%></td>
								<td><%=appointment.getEmail()%></td>
								<td><%=appointment.getPhoneNum()%></td>
								<td><%=appointment.getDiseases()%></td>
								<td><%=doctor.getFullName()%></td>
								<td><%=appointment.getAddress()%></td>
								<td><%=appointment.getStatus()%></td>

							</tr>

							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</section>


			<!-- follow me template -->
			<div class="made-with-love">
				Golden <i>♥</i> <a href="#">Health</a>
			</div>

		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>

</body>
</html>