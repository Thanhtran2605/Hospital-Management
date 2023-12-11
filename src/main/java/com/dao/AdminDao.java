package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.db.DBConnection;
import com.entities.Admin;

public class AdminDao {
	private Connection conn;

	public AdminDao() {
		this.conn = DBConnection.getConnection();
	}

	public Admin login(String email, String password) {
		Admin admin = null;

		try {
			String query = "select * from admin where email=? and password=?";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				admin = new Admin();
				admin.setId(rs.getInt(1));
				admin.setEmail(rs.getString(2));
				admin.setPassword(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return admin;
	}

}
