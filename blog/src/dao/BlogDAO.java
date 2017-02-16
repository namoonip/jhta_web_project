package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.BlogVO;

public class BlogDAO {
	
	public int getSeq()throws SQLException{
		String sql = "select comm_seq.nextval seq from dual";
		

		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs= pstmt.executeQuery();
		
		rs.next();
		int no = rs.getInt("seq");
		
		rs.close();
		pstmt.close();
		con.close();
		return no;	
	}
	
	public void addBlog(BlogVO blog)throws SQLException{
		String sql = "insert into tb_blog(no, title, writer, contents, groupno)"
				+ " values(?, ?, ?, ?, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, blog.getNo());
		pstmt.setString(2, blog.getTitle());
		pstmt.setString(3, blog.getWriter());
		pstmt.setString(4, blog.getContents());
		pstmt.setInt(5, blog.getGroupno());
		
		pstmt.executeUpdate();
		pstmt.close();
		pstmt.close();
		
	}
	
	public BlogVO getBlogByNo(int no)throws SQLException{
		
		String sql = "select no, title, writer, contents, regdate, groupno"
				+ " from tb_blog"
				+ " where no = ?";
		 BlogVO blog = null;
		 
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			blog = new BlogVO();
			blog.setNo(rs.getInt("no"));
			blog.setTitle(rs.getString("title"));
			blog.setWriter(rs.getString("writer"));
			blog.setContents(rs.getString("contents"));
			blog.setRegdate(rs.getDate("regdate"));
			blog.setGroupno(rs.getInt("groupno"));
		
		}
		rs.close();
		pstmt.close();
		con.close();
		return blog;	
	}	
	

	public ArrayList<BlogVO> getBlogList()throws SQLException{
		
		String sql = "select no, title, writer, contents, regdate, groupno"
				+ " from tb_blog"
				+ " order by groupno desc, no asc";
		
		ArrayList<BlogVO> list = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			BlogVO blog = new BlogVO();
			blog.setNo(rs.getInt("no"));
			blog.setTitle(rs.getString("title"));
			blog.setWriter(rs.getString("writer"));
			blog.setContents(rs.getString("contents"));
			blog.setRegdate(rs.getDate("regdate"));
			blog.setGroupno(rs.getInt("groupno"));
			
			list.add(blog);
		}
		rs.close();
		pstmt.close();
		con.close();
		return list;	
	}
}
