package com.dao;

import com.entity.User;

public interface UserDao {

	public boolean userRegistration(User user);
	
	public User login(String email, String password);
	
	public boolean checkPassword(int id, String password);
	
	public boolean updateProfile(User user);
	
	public boolean checkUser(String email);
	
}
