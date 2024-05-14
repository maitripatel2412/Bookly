package com.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.dao.BookDao;
import com.entity.BookDetails;

public class BookDaoImpl implements BookDao {

	private Connection con;

	public BookDaoImpl(Connection con) {
		super();
		this.con = con;
	}

	@Override
	public boolean addBook(BookDetails bookDetails) {

		boolean f = false;

		try {

			String sql = "insert into booksdetails(bookName,author,price,bookCategory,status,photo,userEmail) values(?,?,?,?,?,?,?)";

			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, bookDetails.getBookName());
			ps.setString(2, bookDetails.getAuthor());
			ps.setString(3, bookDetails.getPrice());
			ps.setString(4, bookDetails.getBookCategory());
			ps.setString(5, bookDetails.getStatus());
			ps.setString(6, bookDetails.getPhoto());
			ps.setString(7, bookDetails.getUserEmail());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDetails> getAllBooks() {

		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails books = null;

		try {

			String sql = "select *from booksdetails;";
			PreparedStatement ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				books = new BookDetails();
				books.setBookId(rs.getInt(1));
				books.setBookName(rs.getString(2));
				books.setAuthor(rs.getString(3));
				books.setPrice(rs.getString(4));
				books.setBookCategory(rs.getString(5));
				books.setStatus(rs.getString(6));
				books.setPhoto(rs.getString(7));
				books.setUserEmail(rs.getString(8));

				list.add(books);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public BookDetails getBookById(int id) {

		BookDetails book = null;

		try {

			String sql = "select * from booksdetails where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setInt(1, id);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				book = new BookDetails();
				book.setBookId(rs.getInt(1));
				book.setBookName(rs.getString(2));
				book.setAuthor(rs.getString(3));
				book.setPrice(rs.getString(4));
				book.setBookCategory(rs.getString(5));
				book.setStatus(rs.getString(6));
				book.setPhoto(rs.getString(7));
				book.setUserEmail(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return book;

	}

	@Override
	public boolean updateEditBook(BookDetails b) {

		boolean f = false;

		try {

			String sql = "update booksdetails set bookName=?,author=?,price=?,status=? where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, b.getBookName());
			ps.setString(2, b.getAuthor());
			ps.setString(3, b.getPrice());
			ps.setString(4, b.getStatus());
			ps.setInt(5, b.getBookId());

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	@Override
	public boolean deleteBook(int id) {

		boolean f = false;

		try {

			String sql = "delete from booksdetails where bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setInt(1, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	@Override
	public List<BookDetails> getNewBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;

		try {

			String sql = "select * from booksdetails where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetails> getRecentBook() {

		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;

		try {

			String sql = "select * from booksdetails where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;
	}

	@Override
	public List<BookDetails> getOldBook() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;

		try {

			String sql = "select * from booksdetails where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			int i = 1;
			while (rs.next() && i <= 4) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				i++;

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<BookDetails> getAllRecentBook() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;

		try {

			String sql = "select * from booksdetails where status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<BookDetails> getAllNewBook() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;

		try {

			String sql = "select * from booksdetails where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "New");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<BookDetails> getAllOldBook() {
		
		List<BookDetails> list = new ArrayList<BookDetails>();

		BookDetails b = null;

		try {

			String sql = "select * from booksdetails where bookCategory=? and status=? order by bookId DESC";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "Old");
			ps.setString(2, "Active");

			ResultSet rs = ps.executeQuery();
			
			while (rs.next()) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return list;

	}

	@Override
	public List<BookDetails> getOldBookByUser(String email, String cat) {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		
		try {

			String sql = "select * from booksdetails where bookCategory=? and userEmail=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, cat);
			ps.setString(2, email);

			ResultSet rs = ps.executeQuery();
			
			int i = 1;
			while (rs.next()) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				

			}

		} catch (Exception e) {
			e.printStackTrace();
		}


		
		return list;
	}

	@Override
	public boolean oldBookDelete(String email, String cat, int id) {
		
		boolean f = false;

		try {

			String sql = "delete from booksdetails where bookCategory=? and userEmail=? and bookId=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, cat);
			ps.setString(2, email);
			ps.setInt(3, id);
			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
		
	}

	@Override
	public List<BookDetails> getBookBySearch(String ch) {
		
		List<BookDetails> list = new ArrayList<BookDetails>();
		BookDetails b = null;
		
		try {

			String sql = "select * from booksdetails where bookName like ? or author like ? or bookCategory like ? and status=?";
			PreparedStatement ps = con.prepareStatement(sql);

			ps.setString(1, "%"+ch+"%");
			ps.setString(2, "%"+ch+"%");
			ps.setString(3, "%"+ch+"%");
			ps.setString(4, "Active");

			ResultSet rs = ps.executeQuery();
			
			int i = 1;
			while (rs.next()) {
				b = new BookDetails();

				b.setBookId(rs.getInt(1));
				b.setBookName(rs.getString(2));
				b.setAuthor(rs.getString(3));
				b.setPrice(rs.getString(4));
				b.setBookCategory(rs.getString(5));
				b.setStatus(rs.getString(6));
				b.setPhoto(rs.getString(7));
				b.setUserEmail(rs.getString(8));

				list.add(b);
				

			}

		} catch (Exception e) {
			e.printStackTrace();
		}


		
		return list;

	}
}



