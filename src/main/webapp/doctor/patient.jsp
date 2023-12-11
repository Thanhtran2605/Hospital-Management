<%@page import="com.entities.Appointment"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.AppointmentDao"%>
<%@page import="com.entities.Doctor"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bệnh nhân</title>
<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<link rel="stylesheet" href="../assets/css/list.css">

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

			<main class="table">
				<section class="table__header">
					<h1>Danh sách bệnh nhân</h1>
					<div class="input-group">
						<input type="search" placeholder="Tìm kiếm bệnh nhân...">
						<img src="../assets/images/search.png" alt="">
					</div>
				</section>
				<section class="table__body">
					<table>
						<thead>
							<tr>
								<th>Id</th>
								<th>Họ và tên</th>
								<th>Giới tính</th>
								<th>Tuổi</th>
								<th>Ngày đặt lịch</th>
								<th>Email</th>
								<th>Điện thoại</th>
								<th>Chuẩn đoán</th>
								<th>Trạng thái</th>
								<th>Hành vi</th>
							</tr>
						</thead>
						<tbody>
							<%
							Doctor doctor = (Doctor) session.getAttribute("doctorObj");
							AppointmentDao dao = new AppointmentDao();
							List<Appointment> appointments = dao.getAllAppointmentByDoctorLogin(doctor.getId());

							for (Appointment appointment : appointments) {
							%>

							<tr>
								<th><%=appointment.getId()%></th>
								<th><%=appointment.getFullName()%></th>
								<td><%=appointment.getGender()%></td>
								<td><%=appointment.getAge()%></td>
								<td><%=appointment.getAppointDate()%></td>
								<td><%=appointment.getEmail()%></td>
								<td><%=appointment.getPhoneNum()%></td>
								<td><%=appointment.getDiseases()%></td>
								<td><%=appointment.getStatus()%></td>
								<td>
									<%
									if ("Chưa xử lý".equals(appointment.getStatus())) {
									%> <a href="comment.jsp?id=<%=appointment.getId()%>"
									class="status pending">Ghi chú</a> <%
									} else {
									%>
									<button href="" class="status delivered disabled"
										disabled="disabled">Ghi chú</button> <%
									}
									%>

								</td>
							</tr>

							<%
							}
							%>

						</tbody>
					</table>
				</section>
			</main>
		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>

</body>
</html>

