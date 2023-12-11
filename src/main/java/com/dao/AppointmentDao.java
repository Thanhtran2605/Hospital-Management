package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.entities.Appointment;

public class AppointmentDao {
	private Connection conn;

	public AppointmentDao() {
		conn = DBConnection.getConnection();
	}

	public boolean addAppointment(Appointment appoint) {
		boolean f = false;

		try {
			String query = "insert into appointment(user_id, fullname, gender, age, appoint_date, email, phno, diseases, doctor_id, address, status) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setInt(1, appoint.getUserId());
			ps.setString(2, appoint.getFullName());
			ps.setString(3, appoint.getGender());
			ps.setString(4, appoint.getAge());
			ps.setString(5, appoint.getAppointDate());
			ps.setString(6, appoint.getEmail());
			ps.setString(7, appoint.getPhoneNum());
			ps.setString(8, appoint.getDiseases());
			ps.setInt(9, appoint.getDoctorId());
			ps.setString(10, appoint.getAddress());
			ps.setString(11, appoint.getStatus());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Appointment> getAllAppointment(int userId) {
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;

		try {
			String query = "select * from appointment where user_id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setInt(1, userId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhoneNum(rs.getString(8));
				appointment.setDiseases(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));

				appointments.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appointments;

	}
	
	public List<Appointment> getAllAppointment() {
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;

		try {
			String query = "select * from appointment order by id desc";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhoneNum(rs.getString(8));
				appointment.setDiseases(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));

				appointments.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appointments;

	}

	public List<Appointment> getAllAppointmentByDoctorLogin(int doctorId) {
		List<Appointment> appointments = new ArrayList<Appointment>();
		Appointment appointment = null;

		try {
			String query = "select * from appointment where doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setInt(1, doctorId);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhoneNum(rs.getString(8));
				appointment.setDiseases(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));

				appointments.add(appointment);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appointments;

	}

	public Appointment getAppointmentById(int id) {
		Appointment appointment = null;

		try {
			String query = "select * from appointment where id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				appointment = new Appointment();
				appointment.setId(rs.getInt(1));
				appointment.setUserId(rs.getInt(2));
				appointment.setFullName(rs.getString(3));
				appointment.setGender(rs.getString(4));
				appointment.setAge(rs.getString(5));
				appointment.setAppointDate(rs.getString(6));
				appointment.setEmail(rs.getString(7));
				appointment.setPhoneNum(rs.getString(8));
				appointment.setDiseases(rs.getString(9));
				appointment.setDoctorId(rs.getInt(10));
				appointment.setAddress(rs.getString(11));
				appointment.setStatus(rs.getString(12));

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return appointment;

	}

	public boolean updateCommentStatus(int id, int doctorId, String comment) {
		boolean f = false;

		try {
			String query = "update appointment set status=? where id=? and doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, comment);
			ps.setInt(2, id);
			ps.setInt(3, doctorId);

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
