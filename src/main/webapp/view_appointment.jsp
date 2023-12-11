<%@page import="com.entities.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.entities.Appointment"%>
<%@page import="com.dao.AppointmentDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem đặt lịch</title>

<!-- Link icon favicon -->
<link rel="icon" href="assets/images/logo.png">

<!-- Link file css -->
<%@include file="component/css.jsp"%>

<link rel="stylesheet" href="assets/css/view.css">

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

			<section>
				<!--for demo wrap-->
				<h1>Danh sách lịch khám</h1>
				<div class="tbl-header">
					<table cellpadding="0" cellspacing="0" border="0">
						<thead>
							<tr>
								<th>#</th>

								<th>Họ và tên</th>

								<th>Giới tính</th>

								<th>Tuổi</th>

								<th>Ngày đặt khám</th>

								<th>Chuẩn đoán</th>

								<th>Bác sĩ</th>

								<th>Tình trạng</th>
							</tr>
						</thead>
					</table>
				</div>
				<div class="tbl-content">
					<table cellpadding="0" cellspacing="0" border="0">
						<tbody>
							<%
							User user = (User) session.getAttribute("userObj");
							AppointmentDao dao = new AppointmentDao();
							DoctorDao dao2 = new DoctorDao();
							List<Appointment> appointments = dao.getAllAppointment(user.getId());
							for (Appointment appointment : appointments) {
								Doctor d = dao2.getDoctorById(appointment.getDoctorId());
							%>


							<tr>
								<th><%=appointment.getId()%></th>
								<td><%=appointment.getFullName()%></td>
								<td><%=appointment.getGender()%></td>
								<td><%=appointment.getAge()%></td>
								<td><%=appointment.getAppointDate()%></td>
								<td><%=appointment.getDiseases()%></td>
								<td><%=d.getFullName()%></td>

								<td>
									<%
									if ("Chưa xử lý".equals(appointment.getStatus())) {
									%> <a href="#">Chưa xử lý</a> <%
									} else {
									%> <%=appointment.getStatus()%> <%
									}
									%>

								</td>
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
	<%@include file="virtual_assistant.jsp"%>

</body>
</html>