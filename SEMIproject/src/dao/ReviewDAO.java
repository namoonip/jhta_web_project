package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.ReviewVO;

public class ReviewDAO {
	
	// 게시판 리뷰 좋아요 추가
	public void addReviewLikeByReviewNo(int reviewNo) throws SQLException {
		
		String sql = "update MALL_REVIEW set REVIEW_LIKE = REVIEW_LIKE + 1"
				+ " where REVIEW_NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, reviewNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 해당 게시판 리뷰 삭제
	public void deleteReviewByReviewNo(int reviewNo) throws SQLException {
		
		String sql = "delete from MALL_REVIEW"
				+ " where REVIEW_NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, reviewNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();		
	}
	
	// 해당 게시판에 리뷰 달기
	public void addReviewInBoard(ReviewVO review) throws SQLException{
		
		String sql = "insert into MALL_REVIEW(review_no, review_regdate, review_like,"
					+ "	review_contents, review_gno, review_user_no, "
					+ "	review_user_name) "
					+ " values(REVIEW_SEQ.nextval, sysdate, 0,"
					+ "	?, ?, ?, ?) ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, review.getReviewContents());
		pstmt.setInt(2, review.getReviewGroupNo());
		pstmt.setInt(3, review.getReviewUserNo());
		pstmt.setString(4, review.getReviewUserName());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	// 리뷰 불러오기
	public ArrayList<ReviewVO> getAllBoardListByBoardNo(int boardNo) throws SQLException{
		
		String sql = "select review_no, review_contents, review_regdate,"
				+ " review_user_no, review_user_name, review_like"
				+ " from MALL_REVIEW"
				+ " where review_gno = ?"
				+ " order by review_no desc";
		
		ArrayList<ReviewVO>  reviewList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();		
		
		while(rs.next()) {
			ReviewVO review = new ReviewVO();
			review.setReviewNo(rs.getInt("review_no"));
			review.setReviewContents(rs.getString("review_contents"));
			review.setReviwRegDate(rs.getTimestamp("review_regdate"));
			review.setReviewGroupNo(boardNo);
			review.setReviewUserNo(rs.getInt("review_user_no"));
			review.setReviewUserName(rs.getString("review_user_name"));
			review.setReviewLike(rs.getInt("review_like"));
			reviewList.add(review);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return reviewList;
	}
	
}
