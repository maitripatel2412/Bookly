package com.user.servlet;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.BookDao;
import com.dao.impl.BookDaoImpl;
import com.db.DbConnect;
import com.entity.BookDetails;

@WebServlet("/oldBooksAdd")
@MultipartConfig
public class AddOldBook extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		try {

			String bookName = req.getParameter("bookname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String categories = "Old";
			String status = "Active";
			Part part = req.getPart("bimg");
			String fileName = part.getSubmittedFileName();
			
			String useremail = req.getParameter("user");

			BookDetails bd = new BookDetails(bookName, author, price, categories, status, fileName, useremail);

			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());

//			String path = "/home/maitri/Desktop/OnlineBookStore/EBookCart-App/src/main/webapp/books";

			String path = getServletContext().getRealPath("") + "books";

			System.out.println(path);

			File file = new File(path);
			part.write(path + file.separator + fileName);

			boolean f = dao.addBook(bd);

			HttpSession session = req.getSession();

			if (f) {

				session.setAttribute("sucessMsg", "Book Added Successfully");
				resp.sendRedirect("sellBook.jsp");

			} else {

				session.setAttribute("errorMsg", "Something went wrong! please try it again!");
				resp.sendRedirect("sellBook.jsp");

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
