
package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.UserDaoImpl;
import com.db.DbConnect;
import com.entity.User;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String name = req.getParameter("name");
			String mobileno = req.getParameter("mobileno");
			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			User user1 = new User();
			user1.setName(name);
			user1.setPhoneNo(mobileno);
			user1.setEmail(email);
			user1.setPassword(password);

			HttpSession session = req.getSession();

			if (check != null) {
				UserDaoImpl dao = new UserDaoImpl(DbConnect.getConnection());

				boolean f2 = dao.checkUser(email);

				if (f2) {

					boolean f = dao.userRegistration(user1);
					if (f) {
//						System.out.println("user registration successfully.....");

						session.setAttribute("succMsg", "user registration successfully");
						resp.sendRedirect("register.jsp");

					} else {
//						System.out.println("something wrong with server...");
						session.setAttribute("failedMsg", "something wrong with server");
						resp.sendRedirect("register.jsp");
					}

				} else {

					session.setAttribute("failedMsg", "User Already Exist Try Another Email id !");
					resp.sendRedirect("register.jsp");

				}

			} else {
//				System.out.println("Please click on Agree terms & conditions !");
				session.setAttribute("failedMsg", "Please click on Agree terms & conditions !");
				resp.sendRedirect("register.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
