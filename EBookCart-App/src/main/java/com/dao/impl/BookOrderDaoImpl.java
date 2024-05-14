package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.BookOrderDao;
import com.entity.BookOrder;

public class BookOrderDaoImpl implements BookOrderDao {
	
	private Connection conn;

	public BookOrderDaoImpl(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public boolean saveOrder(List<BookOrder> bookOrder) {
		
		boolean f = false;
		
		try {
			
			String sql = "insert into bookorder(orderId,userName,email,address,phoneNo,bookName,author,price,payment) values(?,?,?,?,?,?,?,?,?)";
			
			conn.setAutoCommit(false);
			PreparedStatement ps = conn.prepareStatement(sql);
			
			for (BookOrder b : bookOrder) {
				ps.setString(1, b.getOrderId());
				ps.setString(2, b.getUserName());
				ps.setString(3, b.getEmail());
				ps.setString(4, b.getAddress());
				ps.setString(5, b.getPhoneNo());
				ps.setString(6, b.getBookName());
				ps.setString(7, b.getAuthorName());
				ps.setDouble(8, b.getPrice());
				ps.setString(9, b.getPaymentType());
				
				ps.addBatch();
			}
			
			int[] count = ps.executeBatch();
			conn.commit();
			f = true;
			conn.setAutoCommit(true);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		return f;
	}

	@Override
	public List<BookOrder> getBook(String email) {
		
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder bo = null;
		
		try {
		
			String sql = "select * from bookorder where email=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				bo = new BookOrder();
				bo.setId(rs.getInt(1));
				bo.setOrderId(rs.getString(2));
				bo.setUserName(rs.getString(3));
				bo.setEmail(rs.getString(4));
				bo.setAddress(rs.getString(5));
				bo.setPhoneNo(rs.getString(6));
				bo.setBookName(rs.getString(7));
				bo.setAuthorName(rs.getString(8));
				bo.setPrice(rs.getDouble(9));
				bo.setPaymentType(rs.getString(10));
				
				list.add(bo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}

	@Override
	public List<BookOrder> getAllOrder() {
		List<BookOrder> list = new ArrayList<BookOrder>();
		BookOrder bo = null;
		
		try {
		
			String sql = "select * from bookorder";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				bo = new BookOrder();
				bo.setId(rs.getInt(1));
				bo.setOrderId(rs.getString(2));
				bo.setUserName(rs.getString(3));
				bo.setEmail(rs.getString(4));
				bo.setAddress(rs.getString(5));
				bo.setPhoneNo(rs.getString(6));
				bo.setBookName(rs.getString(7));
				bo.setAuthorName(rs.getString(8));
				bo.setPrice(rs.getDouble(9));
				bo.setPaymentType(rs.getString(10));
				
				list.add(bo);
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	

}
