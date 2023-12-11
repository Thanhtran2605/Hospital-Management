package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.db.DBConnection;
import com.entities.Specalist;

public class SpecalistDao {
	private Connection conn;

	public SpecalistDao() {
		conn = DBConnection.getConnection();
	}

	public boolean addSpecalist(String spec) {
		boolean f = false;

		try {
			String query = "insert into specalist(spec_name) values (?)";
			PreparedStatement ps = conn.prepareStatement(query);

			ps.setString(1, spec);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public List<Specalist> getAllSpecalist() {
		List<Specalist> specialists = new ArrayList<Specalist>();

		Specalist s = null;

		try {
			String query = "select * from specalist";
			PreparedStatement ps = conn.prepareStatement(query);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				s = new Specalist();
				s.setId(rs.getInt(1));
				s.setSpecialistName(rs.getString(2));
				specialists.add(s);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return specialists;
	}

}
