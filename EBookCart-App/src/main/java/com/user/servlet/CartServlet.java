package com.user.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.BookDaoImpl;
import com.dao.impl.CartDaoImpl;
import com.db.DbConnect;
import com.entity.BookDetails;
import com.entity.Cart;

@WebServlet("/cartServlet")
public class CartServlet extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		  try {
		  
		  int bid = Integer.parseInt(req.getParameter("bid")); 
		  int uid = Integer.parseInt(req.getParameter("uid"));
		  
		  BookDaoImpl dao = new BookDaoImpl(DbConnect.getConnection()); 
		  BookDetails b = dao.getBookById(bid);
		  
		  
		  Cart c = new Cart(); 
		  c.setBid(bid); 
		  c.setUserId(uid);
		  c.setBookName(b.getBookName()); 
		  c.setAuthor(b.getAuthor());
		  c.setPrice(Double.parseDouble(b.getPrice()));
		  c.setTotalPrice(Double.parseDouble(b.getPrice()));
		  
		  CartDaoImpl cartDao = new CartDaoImpl(DbConnect.getConnection()); 
		  boolean f = cartDao.addCart(c);
		  
		  HttpSession session = req.getSession();
		  
		  if(f) {
			  
			  session.setAttribute("addCart", "Book Added to Cart");
			  resp.sendRedirect("allNewBook.jsp");
			   
		  }else {
			  session.setAttribute("failed", "Something Went Wrong !");
			  resp.sendRedirect("allNewBook.jsp"); 
		  }
		  
		  
		  } catch (Exception e) { e.printStackTrace(); }
		  
		 	}

}
