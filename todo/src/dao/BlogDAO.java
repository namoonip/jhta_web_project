package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.BlogVO;
import vo.ReviewVO;

public class BlogDAO {
	
	public void addReadCount(int no) throws SQLException{
		
		String sql = "update tb_blog set readcount=readcount+1 "
				+ " where no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();

	}
	
	// ��� �� ��ȸ�ϱ�
	public int getReviewCountByNo(int no) throws SQLException{
		
		String sql = "select count(*) cnt "
				+ " from TB_REVIEW "
				+ " where blog_no = ?";
		
		int count = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		rs.next();
		count = rs.getInt("cnt");		
		
		rs.close();
		pstmt.close();
		con.close();
		
		return count;
	}
	
	public void deleteReviewByNo(int no) throws SQLException {
		
		String sql = "delete from tb_review where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();		
	}
	
	public void addReview(ReviewVO review) throws SQLException{
		
		String sql = "insert into tb_review(no, regdate, contents, blog_no, user_id) "
				+ " values(comm_seq.nextval, sysdate, ?, ?, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, review.getContents());
		pstmt.setInt(2, review.getBlogNo());
		pstmt.setString(3, review.getUserId());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<ReviewVO> getAllReviw(int no) throws SQLException {
		
		String sql = "select no, user_id, contents, regdate "
				+ " from tb_review "
				+ " where blog_no = ?"
				+ " order by no desc";
		
		ArrayList<ReviewVO> reviewList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			ReviewVO review = new ReviewVO();
			review.setNo(rs.getInt("no"));
			review.setUserId(rs.getString("user_id"));
			review.setContents(rs.getString("contents"));
			review.setRegdate(rs.getTimestamp(("regdate")));
			
			reviewList.add(review);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewList;
	}
	
	public void deleteBlogByNo(int no) throws SQLException {
		
		String sql = "delete from tb_blog where no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public BlogVO getBlogByNo(int no, int pwd) throws SQLException{
		
		String sql = "select no, title, writer, contents, regdate, groupno, user_id, readcount"
				+ " from tb_blog "
				+ " where no = ? "
				+ " and pwd = ?";
				
		BlogVO blog = null;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.setInt(2, pwd);
		ResultSet rs = pstmt.executeQuery();		
		
		while(rs.next()) {
			blog = new BlogVO();
			blog.setNo(no);
			blog.setTitle(rs.getString("title"));
			blog.setWriter(rs.getString("writer"));
			blog.setContents(rs.getString("contents"));
			blog.setRegdate(rs.getTimestamp("regdate"));
			blog.setGroupno(rs.getInt("groupno"));
			blog.setUserId(rs.getString("user_id"));
			blog.setReadcount(rs.getInt("readcount"));
		}	
		rs.close();
		pstmt.close();
		con.close();
				
		return blog;	
		
	}
	
	public int getSeq() throws SQLException{ 
		
		String sql = "select comm_seq.nextval seq from dual";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();		
		
		rs.next();
		int no = rs.getInt("seq");
		
		rs.close();
		pstmt.close();
		con.close();
				
		return no;
	}
	
	
	public void addBlog(BlogVO blog) throws SQLException {
		
		String sql = "insert into tb_blog(no, title, writer, contents, groupno, user_id, pwd, readcount) "
				+ "	values(?, ?, ?, ?, ?, ?, ?, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, blog.getNo());
		pstmt.setString(2, blog.getTitle());
		pstmt.setString(3, blog.getWriter());
		pstmt.setString(4, blog.getContents());
		pstmt.setInt(5, blog.getGroupno());
		pstmt.setString(6, blog.getUserId());
		pstmt.setInt(7, blog.getPwd());
		pstmt.setInt(8, blog.getReadcount());
		
		pstmt.executeUpdate();
		pstmt.close();
		
		con.close();
	}
	

	public ArrayList<BlogVO> getAllBlogList() throws SQLException{
		
		String sql = "select no, title, writer, contents, regdate, groupno, user_id, readcount"
				+ " from tb_blog "
				+ " order by groupno desc, no asc";
		
		ArrayList<BlogVO> blogList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BlogVO blog = new BlogVO();
			blog.setNo(rs.getInt("no"));
			blog.setTitle(rs.getString("title"));
			blog.setWriter(rs.getString("writer"));
			blog.setContents(rs.getString("contents"));
			blog.setRegdate(rs.getTimestamp(("regdate")));
			blog.setGroupno(rs.getInt("groupno"));
			blog.setUserId(rs.getString("user_id"));
			blog.setReadcount(rs.getInt("readcount"));
			
			blogList.add(blog);
		}

		rs.close();
		pstmt.close();
		con.close();
				
		return blogList;
	}
}