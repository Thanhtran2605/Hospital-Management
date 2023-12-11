<%@page import="com.entities.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entities.Specalist"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.SpecalistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xem bác sĩ</title>

<!-- Link icon favicon -->
<link rel="icon" href="../assets/images/logo.png">

<!-- Include library -->
<%@ include file="../component/css_internal.jsp"%>

<link rel="stylesheet" href="../assets/css/edit_delete.css">

</head>
<body>

	<div class="page-wrapper">
		<!-- header -->
		<header class="header" style="background: transparent !important;">

			<!--  Link navbar -->
			<%@include file="navbar.jsp"%>

			<div class="element-one">
				<img src="../assets/images/element-img-1.png" alt="">
			</div>


			<div class="table">
				<div class="table_header">
					<p>THÔNG TIN BÁC SĨ</p>
					<div>
						<a href="doctor.jsp" class="add_new">Thêm bác sĩ</a>
					</div>
				</div>

				<div class="table_section">
					<table>
						<thead>
							<tr>
								<th>Id</th>
								<th>Họ và tên</th>
								<th>Ngày sinh</th>
								<th>Trình độ chuyên môn</th>
								<th>Ảnh</th>
								<th>Chuyên môn</th>
								<th>Email</th>
								<th>Điện thoại</th>
								<th>Tình trạng</th>
							</tr>
						</thead>
						<tbody>

							<%
							DoctorDao doctorDao = new DoctorDao();
							List<Doctor> doctors = doctorDao.getAllDoctor();

							for (Doctor doctor : doctors) {
							%>
							<tr>
								<td><%=doctor.getId()%></td>
								<td><%=doctor.getFullName()%></td>
								<td><%=doctor.getDateOfBirth()%></td>
								<td><%=doctor.getQualification()%></td>
								<td><img src="../assets/<%=doctor.getImageFile()%>"></td>
								<td><%=doctor.getSpecialist()%></td>
								<td><%=doctor.getEmail()%></td>
								<td><%=doctor.getMobNo()%></td>
								<td><a href="edit_doctor.jsp?id=<%=doctor.getId()%>"><i
										class="fa-solid fa-pen-to-square"></i></a> <a
									href="../delete_doctor?id=<%=doctor.getId()%>"><i
										class="fa-solid fa-trash"></i></a></td>
							</tr>
							<%
							}
							%>
						</tbody>
					</table>
				</div>
			</div>

		</header>
	</div>

	<!-- Virtual Assistant  -->
	<%@include file="../virtual_assistant.jsp"%>

</body>
</html>