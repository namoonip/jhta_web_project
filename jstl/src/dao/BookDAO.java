package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;

import vo.Book;

public class BookDAO {
	
	public Book getBookByNo(int no) {
	
		String sql = "select no, title, author, publisher, price, pubdate "
				+ " from TB_BOOK"
				+ "	where no = ?";
				
		Book book = null;
		
		
		try(Connection con = ConnectionUtil.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);)
		{
			pstmt.setInt(1, no);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				book = new Book();
				book.setNo(rs.getInt("no"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				book.setPrice(rs.getInt("price"));
				book.setPubdate(rs.getDate("pubdate"));
			}			
			rs.close();
			
		} catch(SQLException e) {
			e.getStackTrace();
		} 	
		
		return book;
	}
	
	public ArrayList<Book> getAllBooks() {
		
		String sql = "select no, title, author, publisher, price, pubdate "
				+ "	from TB_BOOK";		
		ArrayList<Book> bookList = new ArrayList<>();
		
		try (Connection con = ConnectionUtil.getConnection(); 
			PreparedStatement pstmt = con.prepareStatement(sql);
			ResultSet rs = pstmt.executeQuery();){
			
			while(rs.next()) {
				Book book = new Book();
				book.setNo(rs.getInt("no"));
				book.setTitle(rs.getString("title"));
				book.setAuthor(rs.getString("author"));
				book.setPublisher(rs.getString("publisher"));
				book.setPrice(rs.getInt("price"));
				book.setPubdate(rs.getDate("pubdate"));
	
				bookList.add(book);
			}
			
		} catch(SQLException e) {
			e.getStackTrace();
		} 		
		
		return bookList;
	}
}
