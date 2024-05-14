package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.UserDao;
import com.dao.impl.UserDaoImpl;
import com.db.DbConnect;
import com.entity.User;


@WebServlet("/profileupdate")
public class UpdateProfileServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			int id = Integer.parseInt(req.getParameter("id"));
			String name = req.getParameter("name");
			String mobileno = req.getParameter("mobileno");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			
			User user = new User();
			user.setId(id);
			user.setName(name);
			user.setPhoneNo(mobileno);
			user.setEmail(email);
			user.setPassword(password); 
			
			HttpSession session = req.getSession();
			UserDaoImpl dao = new UserDaoImpl(DbConnect.getConnection());
			boolean f = dao.checkPassword(id, password);
			
			if (f) {
				
				Boolean f2 = dao.updateProfile(user);
				if (f2) {
					
					session.setAttribute("succMsg", "Profile Updated successfully");
					resp.sendRedirect("editProfile.jsp");
					
				}else {
					
					session.setAttribute("failedMsg", "something went wrong ! Try Again !");
					resp.sendRedirect("editProfile.jsp");
					
				}
				
			}else {
				
				session.setAttribute("failedMsg", "Your Password is Incorrect !");
				resp.sendRedirect("editProfile.jsp");
				
			}

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
	}

	
	
	
}
