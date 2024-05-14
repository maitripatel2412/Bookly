package com.dao.impl;

import java.sql.*;

import com.dao.UserDao;
import com.entity.User;

public class UserDaoImpl implements UserDao {

	private Connection con;

	public UserDaoImpl(Connection con) {
		super();
		this.con = con;
	}

	public UserDaoImpl() {
		super();
	}

	public boolean userRegistration(User user) {

		boolean f = false;

		try {

			String sql = "insert into user(name,email,phoneNo,password) values (?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhoneNo());
			ps.setString(4, user.getPassword());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public User login(String email, String password) {

		User user = null;

		try {

			String sql = "select *from user where email=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, email);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				user = new User();
				user.setId(rs.getInt(1));
				user.setName(rs.getString(2));
				user.setEmail(rs.getString(3));
				user.setPhoneNo(rs.getString(4));
				user.setPassword(rs.getString(5));
				user.setAddress(rs.getString(6));
				user.setLandmark(rs.getString(7));
				user.setCity(rs.getString(8));
				user.setState(rs.getString(9));
				user.setPincode(rs.getInt(10));
			}

		} catch (Exception e) {

		}

		return user;
	}

	@Override
	public boolean checkPassword(int id, String password) {

		boolean f = false;

		try {

			String sql = "select *from user where id=? and password=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);
			ps.setString(2, password);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean updateProfile(User user) {

		boolean f = false;

		try {

			String sql = "update user set name=?,email=?,phoneNo=? where id=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPhoneNo());
			ps.setInt(4, user.getId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public boolean checkUser(String email) {

		boolean f = true;

		try {

			String sql = "select * from user where email=?";

			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1,email);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = false;
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

}
