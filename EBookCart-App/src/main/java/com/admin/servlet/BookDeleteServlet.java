package com.admin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.BookDaoImpl;
import com.db.DbConnect;

@WebServlet("/deleteBook")
public class BookDeleteServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			int id = Integer.parseInt(req.getParameter("id"));

			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
			boolean f = dao.deleteBook(id);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("sucessMsg", "Book Deleted Successfully !");
				resp.sendRedirect("admin/allBooks.jsp");

			} else {

				session.setAttribute("errorMsg", "Somthing is going wrong !");
				resp.sendRedirect("admin/allBooks.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
