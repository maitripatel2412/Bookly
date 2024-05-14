package com.dao;

import java.util.List;

import com.entity.BookOrder;

public interface BookOrderDao {
	
	public boolean saveOrder(List<BookOrder> bookOrder);
	
	public List<BookOrder> getBook(String email);
	
	public List<BookOrder> getAllOrder();
	
}
