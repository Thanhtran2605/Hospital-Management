package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.print.Doc;

import com.db.DBConnection;
import com.entities.Doctor;

public class DoctorDao {
	private Connection conn;

	public DoctorDao() {
		conn = DBConnection.getConnection();
	}

	public boolean registerDoctor(Doctor doctor) {
		boolean f = false;

		try {
			String query = "insert into doctor(full_name, dob, qualification, specalist, email, mobno, password, imagefile) values (?, ?, ?, ?, ?, ?, ?, ?)";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getDateOfBirth());
			ps.setString(3, doctor.getQualification());
			ps.setString(4, doctor.getSpecialist());
			ps.setString(5, doctor.getEmail());
			ps.setString(6, doctor.getMobNo());
			ps.setString(7, doctor.getPassword());
			ps.setString(8, doctor.getImageFile());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Doctor> getAllDoctor() {
		List<Doctor> doctors = new ArrayList<Doctor>();
		Doctor doctor = null;

		try {
			String query = "select * from doctor order by id asc";
			PreparedStatement ps = conn.prepareStatement(query);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				doctor = new Doctor();
				doctor.setId(rs.getInt(1));
				doctor.setFullName(rs.getString(2));
				doctor.setDateOfBirth(rs.getString(3));
				doctor.setQualification(rs.getString(4));
				doctor.setSpecialist(rs.getString(5));
				doctor.setEmail(rs.getString(6));
				doctor.setMobNo(rs.getString(7));
				doctor.setPassword(rs.getString(8));
				doctor.setImageFile(rs.getString(9));

				doctors.add(doctor);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctors;
	}

	public Doctor getDoctorById(int id) {
		Doctor doctor = null;

		try {
			String query = "select * from doctor where id = ?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				doctor = new Doctor();
				doctor.setId(rs.getInt(1));
				doctor.setFullName(rs.getString(2));
				doctor.setDateOfBirth(rs.getString(3));
				doctor.setQualification(rs.getString(4));
				doctor.setSpecialist(rs.getString(5));
				doctor.setEmail(rs.getString(6));
				doctor.setMobNo(rs.getString(7));
				doctor.setPassword(rs.getString(8));
				doctor.setImageFile(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctor;
	}

	public boolean updateDoctor(Doctor doctor) {
		boolean f = false;

		try {
			String query = "update doctor set full_name=?, dob=?, qualification=?, specalist=?, email=?, mobno=?, password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getDateOfBirth());
			ps.setString(3, doctor.getQualification());
			ps.setString(4, doctor.getSpecialist());
			ps.setString(5, doctor.getEmail());
			ps.setString(6, doctor.getMobNo());
			ps.setString(7, doctor.getPassword());
			ps.setInt(8, doctor.getId());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public boolean deleteDoctor(int id) {
		boolean f = false;

		try {
			String query = "delete from doctor where id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			ps.setInt(1, id);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public Doctor login(String email, String password) {
		Doctor doctor = null;

		try {
			String query = "select * from doctor where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				doctor = new Doctor();
				doctor.setId(rs.getInt(1));
				doctor.setFullName(rs.getString(2));
				doctor.setDateOfBirth(rs.getString(3));
				doctor.setQualification(rs.getString(4));
				doctor.setSpecialist(rs.getString(5));
				doctor.setEmail(rs.getString(6));
				doctor.setMobNo(rs.getString(7));
				doctor.setPassword(rs.getString(8));
				doctor.setImageFile(rs.getString(9));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return doctor;
	}

	// Hiển thị index Admin	
	public int countDoctor() {
		int i = 0;

		try {
			String query = "select * from doctor";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public int countAppointment() {
		int i = 0;

		try {
			String query = "select * from appointment";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public int countUser() {
		int i = 0;

		try {
			String query = "select * from user";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}

	public int countSpecalist() {
		int i = 0;

		try {
			String query = "select * from specalist";
			PreparedStatement ps = conn.prepareStatement(query);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	// Hiển thị index Doctor
	public int countAppointmentByDoctorId(int did) {
		int i = 0;

		try {
			String query = "select * from appointment where doctor_id=?";
			PreparedStatement ps = conn.prepareStatement(query);
			
			ps.setInt(1, did);
			
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				i++;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return i;
	}
	
	public boolean checkOldPassword(int userId, String oldPassword) {
		boolean f = false;

		try {
			String query = "select * from doctor where id=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setInt(1, userId);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changePassword(int userId, String newPassword) {
		boolean f = false;

		try {
			String query = "update doctor set password=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, newPassword);
			ps.setInt(2, userId);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public boolean editDoctorProfile(Doctor doctor) {
		boolean f = false;

		try {
			String query = "update doctor set full_name=?, dob=?, qualification=?, specalist=?, email=?, mobno=? where id=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, doctor.getFullName());
			ps.setString(2, doctor.getDateOfBirth());
			ps.setString(3, doctor.getQualification());
			ps.setString(4, doctor.getSpecialist());
			ps.setString(5, doctor.getEmail());
			ps.setString(6, doctor.getMobNo());
			ps.setInt(7, doctor.getId());

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
