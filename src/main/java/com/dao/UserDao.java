package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.entities.User;
import com.mysql.cj.xdevapi.Result;

public class UserDao {
	private Connection conn = DBConnection.getConnection();

	public boolean register(User user) {

		boolean f = false;

		try {
			String query = "insert into user(full_name, email, password) values (?, ?, ?)";

			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, user.getFullName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());

			int result = ps.executeUpdate();

			if (result == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;

	}

	public User login(String em, String psw) {

		User user = null;

		try {
			String query = "select * from user where email = ? and password = ?";

			PreparedStatement ps = conn.prepareStatement(query);
			ps.setString(1, em);
			ps.setString(2, psw);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setFullName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPassword(rs.getString(4));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return user;

	}

	public boolean checkOldPassword(int userId, String oldPassword) {
		boolean f = false;

		try {
			String query = "select * from user where id=? and password=?";
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
			String query = "update user set password=? where id=?";
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

}
