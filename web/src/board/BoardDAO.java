package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;

public class BoardDAO {
	
	// 새로운 게시글 저장하기
	public void addBoard(BoardVO board) {
		String sql = "insert into TB_BOARD(no, title, writer, contents, ip) "
				+ " values(board_seq.nextval, ?, ?, ?, ?)";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnectionUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContents());
			pstmt.setString(4, board.getIp());
			pstmt.executeUpdate();
			
		} catch(SQLException e) {
			e.getStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (pstmt != null) try{pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (con != null) try{con.close();} catch (SQLException e) {e.printStackTrace();}
		}
	}
	
	// 등록된 모든 게시글을 제공하기	
	public ArrayList<BoardVO> getAllBoard() {
		ArrayList<BoardVO> boardList = new ArrayList<>();
		String sql = "select * from TB_BOARD ";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardVO board = new BoardVO();
				board.setNo(rs.getInt("no"));
				board.setTitle(rs.getString("title"));
				board.setWriter(rs.getString("writer"));
				board.setContents(rs.getString("contents"));
				board.setLikes(rs.getInt("likes"));
				board.setIp(rs.getString("ip"));
				board.setRegDate(rs.getDate("regdate"));
				boardList.add(board);
			}
			
		} catch(SQLException e) {
			e.getStackTrace();
			System.err.println(e.getMessage());
			
		} finally {
			if (rs != null) try{rs.close();} catch (SQLException e) {e.printStackTrace();}
			if (pstmt != null) try{pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (con != null) try{con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		return boardList;
	}
	
	// 특정 글 번호에 해당하는 게시글을 제공하기
	public void delBoradByNum(int no) {
		String sql ="delete from TB_BOARD where no = ? ";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnectionUtil.getConnection();
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, no);
			pstmt.executeUpdate();
		} catch(SQLException e) {
			e.getStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (pstmt != null) try{pstmt.close();} catch (SQLException e) {e.printStackTrace();}
			if (con != null) try{con.close();} catch (SQLException e) {e.printStackTrace();}
		}
		
	}
	
	
	// 제목에 특정 단어가 포함된 게시글을 제공하기

}
