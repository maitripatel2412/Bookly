package com.user.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.impl.BookOrderDaoImpl;
import com.dao.impl.CartDaoImpl;
import com.db.DbConnect;
import com.entity.BookDetails;
import com.entity.BookOrder;
import com.entity.Cart;


@WebServlet("/order")
public class OrderServlet extends HttpServlet{

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		try {
			
			HttpSession session = req.getSession();
			
			int id = Integer.parseInt(req.getParameter("id"));
			
			String name = req.getParameter("name");
			String email = req.getParameter("email");
			String phoneNo = req.getParameter("phoneNo");
			String address = req.getParameter("address");
			String landmark = req.getParameter("landmark");
			String city = req.getParameter("city");
			String state = req.getParameter("state");
			String pincode = req.getParameter("pincode");
			String paymentType = req.getParameter("payment");
			
			String fullAddress = address + "," + landmark + "," + city + "," + state + "," + pincode;
			
			/*
			 * System.out.println(name + " " + email + " " + phoneNo + " " + fullAddress +
			 * " " + paymentType);
			 */
			
			CartDaoImpl dao = new CartDaoImpl(DbConnect.getConnection());
			
			List<Cart> list = dao.getBookByUser(id);
			
			if (list.isEmpty()) {
				 
				session.setAttribute("failedMsg", "Add Items To Your Cart !");
				resp.sendRedirect("checkout.jsp");
				
			}
			else {
				
				BookOrderDaoImpl dao2 = new BookOrderDaoImpl(DbConnect.getConnection());
				
				BookOrder bo; 
				
				ArrayList<BookOrder> orderList = new ArrayList<BookOrder>();
				
				Random r = new Random();
				
				
				for (Cart c : list) {
					 
					bo = new BookOrder();
					
					bo.setOrderId("BOOK-ORD-00" + r.nextInt(1000) );
					bo.setUserName(name);
					bo.setEmail(email);
					bo.setAddress(fullAddress); 
					bo.setPhoneNo(phoneNo);
					bo.setBookName(c.getBookName());
					bo.setAuthorName(c.getAuthor());
					bo.setPrice(c.getPrice());
					bo.setPaymentType(paymentType);
					
					orderList.add(bo);
					
				}
				
				if ("noselect".equals(paymentType)) {
				
					session.setAttribute("failedMsg", "Please select the payment method !");
					resp.sendRedirect("checkout.jsp");
					
				}else {
					
					boolean f = dao2.saveOrder(orderList);
					
					if (f) {
						resp.sendRedirect("orderSuccess.jsp");
						
					}
					else {
						session.setAttribute("failedMsg", "Something went wrong !");
						resp.sendRedirect("checkout.jsp");
					}	
				}
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	
	
	
}
