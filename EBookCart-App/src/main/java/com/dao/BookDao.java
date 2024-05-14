package com.dao;

import java.util.List;

import com.entity.BookDetails;

public interface BookDao {

	public boolean addBook(BookDetails bookDetails);
	
	public List<BookDetails> getAllBooks(); 
	
	 public BookDetails getBookById(int id);
	 
	 public boolean updateEditBook(BookDetails b);
	 
	 public boolean deleteBook(int id);
	 
	 public List<BookDetails> getNewBook();
	 
	 public List<BookDetails> getRecentBook();
	 
	 public List<BookDetails> getOldBook();
	 
	 public List<BookDetails> getAllRecentBook();
	 
	 public List<BookDetails> getAllNewBook();
	 
	 public List<BookDetails> getAllOldBook();
	 
	 public List<BookDetails> getOldBookByUser(String email, String cat);
	 
	 public boolean oldBookDelete(String email, String cat, int id); 
	 
	 public List<BookDetails> getBookBySearch(String ch);
	
}










