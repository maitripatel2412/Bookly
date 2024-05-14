package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.BookDaoImpl;
import com.db.DbConnect;


@WebServlet("/oldBookDelete")
@MultipartConfig
public class DeleteOldBook extends HttpServlet{

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			String email = req.getParameter("email");
			int id = Integer.parseInt(req.getParameter("id")); 

			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
			boolean f = dao.oldBookDelete(email, "Old",id);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("sucessMsg", "Old Book Deleted Successfully !");
				resp.sendRedirect("userOldBook.jsp");

			} else {

				session.setAttribute("errorMsg", "Somthing is going wrong !");
				resp.sendRedirect("userOldBook.jsp");

			}

			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
	
}
