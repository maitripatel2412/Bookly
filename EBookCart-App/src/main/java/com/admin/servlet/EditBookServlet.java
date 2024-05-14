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
import com.entity.BookDetails;

@WebServlet("/editBook")
public class EditBookServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		try {

			int id = Integer.parseInt(req.getParameter("id"));
			String bookName = req.getParameter("bookname");
			String author = req.getParameter("author");
			String price = req.getParameter("price");
			String status = req.getParameter("bstatus");
			
			BookDetails b = new BookDetails();
			b.setBookId(id);
			b.setBookName(bookName);
			b.setAuthor(author);
			b.setPrice(price);
			b.setStatus(status);
			
			BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection());
			boolean f = dao.updateEditBook(b);
	
			HttpSession session = req.getSession();
			
			if(f) {
				
				session.setAttribute("sucessMsg", "Book Updated Successfully !");
				resp.sendRedirect("admin/allBooks.jsp");
				 
			}else {
				
				session.setAttribute("errorMsg", "Somthing is going wrong !");
				resp.sendRedirect("admin/allBooks.jsp");
				
			}
			
			
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
