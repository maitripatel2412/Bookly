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

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			UserDaoImpl dao = new UserDaoImpl(DbConnect.getConnection());

			HttpSession session = req.getSession();

			String email = req.getParameter("email");
			String password = req.getParameter("password");
			String check = req.getParameter("check");

			if ("admin@gmail.com".equals(email) && "admin".equals(password)) {

				User user = new User();
				user.setName("Admin");
				session.setAttribute("userobj", user);

				resp.sendRedirect("admin/adminHome.jsp");
			} else {

				User user = dao.login(email, password);

				if (user != null) {
					session.setAttribute("userobj", user);
					resp.sendRedirect("index.jsp");
					return;
				} else {
					session.setAttribute("failedmsg", "enter valid email or password !");
					resp.sendRedirect("login.jsp");
				}

				
				resp.sendRedirect("home.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}

//}
