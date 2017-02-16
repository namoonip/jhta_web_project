package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.BoardVO;

public class BoardDAO {
	
public void addBoardReview(BoardVO vo) throws SQLException {
		
		String sql = "insert into MALL_BOARD(BOARD_NO, BOARD_REGDATE, BOARD_READCOUNT, BOARD_TYPE,"
				+ " BOARD_TITLE, BOARD_CONTENTS, "
				+ " BOARD_UCCURL, "
				+ " BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,"
				+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, BOARD_CATEGORY, "
				+ " BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, BOARD_GNO) "
				+ " values(board_seq.nextval, sysdate, 0, ?, "
				+ "	?, ?, "
				+ "	?, "
				+ "	?, ?, ?, ?, ?,"
				+ " ?, ?, ?, ?,"
				+ " ?, ?, ?, ? )";
				
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo.getBoardType());
		pstmt.setString(2, vo.getBoardTitle());
		pstmt.setString(3, vo.getBoardContents());
		pstmt.setString(4, vo.getUccURL());
		pstmt.setString(5, vo.getBoardFileName1());
		pstmt.setString(6, vo.getBoardFileName2());
		pstmt.setString(7, vo.getBoardFileName3());
		pstmt.setString(8, vo.getBoardFileName4());
		pstmt.setString(9, vo.getBoardFileName5());
		pstmt.setString(10, vo.getBoardPwd());
		pstmt.setString(11, vo.getSecret());
		pstmt.setString(12, vo.getUserName());
		pstmt.setString(13, vo.getBoardCategory());
		pstmt.setInt(14, vo.getBoardUserNo());
		pstmt.setDouble(15, vo.getBoardSatis());
		pstmt.setInt(16, vo.getBoardItemNo());
		pstmt.setInt(17, vo.getBoardGroupNo());
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	public int getBoardSeq() throws SQLException{
		
		String sql = "select board_seq.nextval seq from dual";
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
	
	public ArrayList<BoardVO> getSearchBoardProductResult(int typeNo, int searchDate, String product, int beginIndex, int endIndex) throws SQLException{
		
		String sql =  "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS, "
				+ "		BOARD_UCCURL, BOARD_TYPE,  "
				+ " 	BOARD_FILE1, BOARD_FILE2,  "
				+ " 	BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,  "
				+ "	 	BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ " 	BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY,  "
				+ "	 	BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, "
				+ "		ITEM_NAME, ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO "
				+ "	 from (select row_number() over(order by board_no desc) rn, BOARD_NO,  "
				+ "					BOARD_TITLE, BOARD_CONTENTS, BOARD_UCCURL,  "
				+ "					BOARD_TYPE, BOARD_FILE1, BOARD_FILE2,BOARD_FILE3,  "
				+ "					BOARD_FILE4, BOARD_FILE5,BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ "					BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, BOARD_USER_NO,  "
				+ "					BOARD_SATIS, BOARD_ITEM_NO, ITEM_NAME, ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO  "
				+ "				from MALL_BOARD, MALL_ITEM  "
				+ "				where (MALL_BOARD.BOARD_ITEM_NO = MALL_ITEM.ITEM_NO)  "
				+ "	 			AND BOARD_TYPE = ? "
				+ "				AND LOWER(ITEM_NAME) LIKE LOWER(?)"
				+ "				AND (trunc(sysdate - BOARD_REGDATE) < ?))  "
				+ "	 where rn >= ? and rn <= ? ";

		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		product = "%"+product+"%";
		pstmt.setInt(1, typeNo);
		pstmt.setString(2, product);
		pstmt.setInt(3, searchDate);
		pstmt.setInt(4, beginIndex);
		pstmt.setInt(5, endIndex);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardItemInfo(rs.getString("ITEM_NAME"));
			board.setBoardItemGroupNo(rs.getInt("ITEM_GROUP_NO"));
			board.setBoardItemSrc(rs.getString("ITEM_SRC"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
	
	public ArrayList<BoardVO> getAllBoardByItemNo(int itemNo) throws SQLException{
		
		String sql = "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS,"
				+ " BOARD_UCCURL, BOARD_FILE1, BOARD_FILE2,"
				+ " BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,"
				+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,"
				+ " BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, "
				+ " BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO "
				+ " from MALL_BOARD, MALL_ITEM "
				+ " where BOARD_TYPE = 6 "
				+ " and BOARD_ITEM_NO = ? "
				+ " and (MALL_BOARD.BOARD_ITEM_NO = MALL_ITEM.ITEM_NO) "
				+ " order by BOARD_NO desc ";
				
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, itemNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(6);
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			boardList.add(board);			
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boardList;
	}
		
	public ArrayList<BoardVO> getSearchBoardTitleResult(int typeNo, int searchDate, String title, int beginIndex, int endIndex) throws SQLException{
		
		String sql =  "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS, "
				+ "		BOARD_UCCURL, BOARD_TYPE,  "
				+ " 	BOARD_FILE1, BOARD_FILE2,  "
				+ " 	BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,  "
				+ "	 	BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ " 	BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY,  "
				+ "	 	BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, "
				+ "		ITEM_NAME, ITEM_GROUP_NO, BOARD_GNO "
				+ "	 from (select row_number() over(order by board_no desc) rn, BOARD_NO, ITEM_SRC  "
				+ "					BOARD_TITLE, BOARD_CONTENTS, BOARD_UCCURL,  "
				+ "					BOARD_TYPE, BOARD_FILE1, BOARD_FILE2,BOARD_FILE3,  "
				+ "					BOARD_FILE4, BOARD_FILE5,BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ "					BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, BOARD_USER_NO,  "
				+ "					BOARD_SATIS, BOARD_ITEM_NO, ITEM_NAME, ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO "
				+ "				from MALL_BOARD, MALL_ITEM  "
				+ "				where (MALL_BOARD.BOARD_ITEM_NO = MALL_ITEM.ITEM_NO)  "
				+ "	 			AND BOARD_TYPE = ? "
				+ "				AND LOWER(BOARD_TITLE) LIKE LOWER(?)"
				+ "				AND (trunc(sysdate - BOARD_REGDATE) < ?))  "
				+ "	 where rn >= ? and rn <= ? ";
		
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		title = "%"+title+"%";
		pstmt.setInt(1, typeNo);
		pstmt.setString(2, title);
		pstmt.setInt(3, searchDate);
		pstmt.setInt(4, beginIndex);
		pstmt.setInt(5, endIndex);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardItemInfo(rs.getString("ITEM_NAME"));
			board.setBoardItemGroupNo(rs.getInt("ITEM_GROUP_NO"));
			board.setBoardItemSrc(rs.getString("ITEM_SRC"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
	
	public ArrayList<BoardVO> getSearchBoardContentsResult(int typeNo, int searchDate, String contents, int beginIndex, int endIndex) throws SQLException{
		
		String sql =  "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS, "
				+ "		BOARD_UCCURL, BOARD_TYPE,  "
				+ " 	BOARD_FILE1, BOARD_FILE2,  "
				+ " 	BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,  "
				+ "	 	BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ " 	BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY,  "
				+ "	 	BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, ITEM_NAME, "
				+ "		ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO "
				+ "	 from (select row_number() over(order by board_no desc) rn, BOARD_NO,  "
				+ "					BOARD_TITLE, BOARD_CONTENTS, BOARD_UCCURL,  "
				+ "					BOARD_TYPE, BOARD_FILE1, BOARD_FILE2,BOARD_FILE3,  "
				+ "					BOARD_FILE4, BOARD_FILE5,BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ "					BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, BOARD_USER_NO,  "
				+ "					BOARD_SATIS, BOARD_ITEM_NO, ITEM_NAME, ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO  "
				+ "				from MALL_BOARD, MALL_ITEM  "
				+ "				where (MALL_BOARD.BOARD_ITEM_NO = MALL_ITEM.ITEM_NO)  "
				+ "	 			AND BOARD_TYPE = ? "
				+ "				AND LOWER(BOARD_CONTENTS) LIKE LOWER(?)"
				+ "				AND (trunc(sysdate - BOARD_REGDATE) < ?))  "
				+ "	 where rn >= ? and rn <= ? ";
		
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		contents = "%"+contents+"%";
		pstmt.setInt(1, typeNo);
		pstmt.setString(2, contents);
		pstmt.setInt(3, searchDate);
		pstmt.setInt(4, beginIndex);
		pstmt.setInt(5, endIndex);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardItemInfo(rs.getString("ITEM_NAME"));
			board.setBoardItemGroupNo(rs.getInt("ITEM_GROUP_NO"));
			board.setBoardItemSrc(rs.getString("ITEM_SRC"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
	
	public ArrayList<BoardVO> getSearchBoardWriterResult(int typeNo, int searchDate, String writer, int beginIndex, int endIndex) throws SQLException{
		
		String sql =  "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS, "
				+ "		BOARD_UCCURL, BOARD_TYPE,  "
				+ " 	BOARD_FILE1, BOARD_FILE2,  "
				+ " 	BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,  "
				+ "	 	BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ " 	BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY,  "
				+ "	 	BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, "
				+ "		ITEM_NAME, ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO "
				+ "	 from (select row_number() over(order by board_no desc) rn, BOARD_NO,  "
				+ "					BOARD_TITLE, BOARD_CONTENTS, BOARD_UCCURL,  "
				+ "					BOARD_TYPE, BOARD_FILE1, BOARD_FILE2,BOARD_FILE3,  "
				+ "					BOARD_FILE4, BOARD_FILE5,BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,  "
				+ "					BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, BOARD_USER_NO,  "
				+ "					BOARD_SATIS, BOARD_ITEM_NO, ITEM_NAME, ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO  "
				+ "				from MALL_BOARD, MALL_ITEM  "
				+ "				where (MALL_BOARD.BOARD_ITEM_NO = MALL_ITEM.ITEM_NO)  "
				+ "	 			AND BOARD_TYPE = ? "
				+ "				AND LOWER(BOARD_USER_NAME) LIKE LOWER(?)"
				+ "				AND (trunc(sysdate - BOARD_REGDATE) < ?))  "
				+ "	 where rn >= ? and rn <= ? ";

		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		writer = "%"+writer+"%";
		pstmt.setInt(1, typeNo);
		pstmt.setString(2, writer);
		pstmt.setInt(3, searchDate);
		pstmt.setInt(4, beginIndex);
		pstmt.setInt(5, endIndex);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardItemInfo(rs.getString("ITEM_NAME"));
			board.setBoardItemGroupNo(rs.getInt("ITEM_GROUP_NO"));
			board.setBoardItemSrc(rs.getString("ITEM_SRC"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
	
	public void deleteFileName1InBoard(int boardNo, String fileName) throws SQLException {
		
		String sql = "update MALL_BOARD "
				+ " set BOARD_FILE1 = null"
				+ " where BOARD_NO = ?"
				+ "	and BOARD_FILE1 = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.setString(2, fileName);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	public void deleteFileName2InBoard(int boardNo, String fileName) throws SQLException {
		
		String sql = "update MALL_BOARD "
				+ " set BOARD_FILE2 = null"
				+ " where BOARD_NO = ?"
				+ "	and BOARD_FILE2 = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.setString(2, fileName);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	public void deleteFileName3InBoard(int boardNo, String fileName) throws SQLException {
		
		String sql = "update MALL_BOARD "
				+ " set BOARD_FILE3 = null"
				+ " where BOARD_NO = ?"
				+ "	and BOARD_FILE3 = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.setString(2, fileName);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	public void deleteFileName4InBoard(int boardNo, String fileName) throws SQLException {
		
		String sql = "update MALL_BOARD "
				+ " set BOARD_FILE4 = null"
				+ " where BOARD_NO = ?"
				+ "	and BOARD_FILE4 = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.setString(2, fileName);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	public void deleteFileName5InBoard(int boardNo, String fileName) throws SQLException {
		
		String sql = "update MALL_BOARD "
				+ " set BOARD_FILE5 = null"
				+ " where BOARD_NO = ?"
				+ "	and BOARD_FILE5 = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		pstmt.setString(2, fileName);
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	public ArrayList<String> getAllFileList(BoardVO boardNo) throws SQLException{
		
		String sql = "select BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_FILE4, BOARD_FILE5"
				+ "	from mall_board "
				+ " where board_no = ?";
		
		ArrayList<String> fileList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo.getBoardNo());
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			fileList.add(rs.getString("BOARD_FILE1"));
			fileList.add(rs.getString("BOARD_FILE2"));
			fileList.add(rs.getString("BOARD_FILE3"));
			fileList.add(rs.getString("BOARD_FILE4"));
			fileList.add(rs.getString("BOARD_FILE5"));
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return fileList;
	}
	
	public void updateBoard(BoardVO board) throws SQLException{
		
		String sql = "update MALL_BOARD set BOARD_TITLE = ?, BOARD_REGDATE = sysdate, "
				+ "	BOARD_CATEGORY = ?, BOARD_CONTENTS = ?, BOARD_SATIS = ?, BOARD_TYPE = ?"
				+ " where BOARD_NO = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, board.getBoardTitle());
		pstmt.setString(2, board.getBoardCategory());
		pstmt.setString(3, board.getBoardContents());
		pstmt.setDouble(4, board.getBoardSatis());
		pstmt.setInt(5, board.getBoardType());
		pstmt.setInt(6, board.getBoardNo());
		pstmt.executeUpdate();	
		
		pstmt.close();
		con.close();
	}
	
	public void deleteBoardByNo(String boardNo) throws SQLException{
		
		String sql = "DELETE FROM MALL_BOARD "
					 + " WHERE BOARD_NO = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, boardNo);
		pstmt.executeUpdate();	
		
		pstmt.close();
		con.close();
	}
	
	// 보드 타입에 따라 하나씩 가져오기
	public BoardVO getBoardDetailByNo(int boardNo) throws SQLException{
		
		String sql = "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS,"
				+ " BOARD_UCCURL, BOARD_TYPE, "
				+ " BOARD_FILE1, BOARD_FILE2, "
				+ " BOARD_FILE3, BOARD_FILE4, BOARD_FILE5, "
				+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, "
				+ " BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY,"
				+ " BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO"
				+ " from MALL_BOARD"
				+ " where BOARD_NO = ?";
		
		BoardVO board = null;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, boardNo);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			board = new BoardVO();
			board.setBoardNo((boardNo));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return board;
	}
	
	
	public ArrayList<BoardVO> getBoardQnAListForPaging(int begin, int end, int typeNo) throws SQLException {
		
		String sql = "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS, BOARD_UCCURL, BOARD_TYPE, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_FILE4, BOARD_FILE5, "
				+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, BOARD_GNO "
				+ " from (select row_number() over(order by board_no asc) rn, BOARD_NO,  "
				+ " 		BOARD_TITLE, BOARD_CONTENTS, BOARD_UCCURL,  "
				+ " 		BOARD_TYPE, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, " 
				+ " 		BOARD_FILE4, BOARD_FILE5,BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, " 
				+ " 		BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, BOARD_USER_NO, BOARD_GNO, "
				+ " 		BOARD_SATIS, BOARD_ITEM_NO from MALL_BOARD where BOARD_TYPE = ?"
				+ "			order by BOARD_GNO desc, BOARD_NO asc) "
				+ " where rn >= ? and rn <= ? "
				+ " order by BOARD_GNO desc, BOARD_NO asc";
		
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, typeNo);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);		
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boardList;
	}
	
	// 게시판 페이징 처리
	public ArrayList<BoardVO> getBoardListForPaging(int begin, int end, int typeNo) throws SQLException {
		
		String sql = "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS,"
					+ " 	BOARD_UCCURL, BOARD_TYPE, "
					+ " 	BOARD_FILE1, BOARD_FILE2, "
					+ " 	BOARD_FILE3, BOARD_FILE4, BOARD_FILE5, "
					+ " 	BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, "
					+ " 	BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, "
					+ " 	BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, ITEM_NAME, "
					+ "		ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO"
					+ " from (select row_number() over(order by board_no desc) rn, BOARD_NO, "
					+ "				BOARD_TITLE, BOARD_CONTENTS, BOARD_UCCURL, "
					+ "				BOARD_TYPE, BOARD_FILE1, BOARD_FILE2,BOARD_FILE3, "
					+ "				BOARD_FILE4, BOARD_FILE5,BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, "
					+ "				BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, BOARD_USER_NO, "
					+ "				BOARD_SATIS, BOARD_ITEM_NO, ITEM_NAME, ITEM_GROUP_NO, ITEM_SRC, BOARD_GNO "
					+ "			from MALL_BOARD, MALL_ITEM " 
					+ "			where (MALL_BOARD.BOARD_ITEM_NO = MALL_ITEM.ITEM_NO) "
					+ " 		AND BOARD_TYPE = ?) "
					+ " where rn >= ? and rn <= ? ";
		
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, typeNo);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardItemInfo(rs.getString("ITEM_NAME"));
			board.setBoardItemGroupNo(rs.getInt("ITEM_GROUP_NO"));
			board.setBoardItemSrc(rs.getString("ITEM_SRC"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);		
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return boardList;
	}
	
	// 게시판 총 갯수 불러오기
	public int getTotalRows(int no) throws SQLException {
		
		String sql = "select count(*) cnt from mall_board where BOARD_TYPE = ?";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return totalRows;
	}
	
	
	// 조회수 불러오기
	public void addBoardReadCount(int no) throws SQLException{
		
		String sql = "update MALL_BOARD set BOARD_READCOUNT=BOARD_READCOUNT+1 "
				+ " where BOARD_NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();

	}
	
	// 카테고리에 따른 게시판 불러오기
	public ArrayList<BoardVO> getAllBoardListByType(int no) throws SQLException{
		
		String sql = "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS,"
				+ " BOARD_UCCURL, "
				+ " BOARD_FILE1, BOARD_FILE2,"
				+ " BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,"
				+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME,"
				+ " BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, "
				+ " BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, BOARD_GNO"
				+ " from MALL_BOARD"
				+ " where BOARD_TYPE = ?"
				+ " order by BOARD_NO desc";
		
		ArrayList<BoardVO> boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(no);
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);
		}
		
		pstmt.close();
		con.close();
		
		return boardList;
	}
	
	// Board 추가하기
	public void addBoard(BoardVO vo) throws SQLException {
		
		String sql = "insert into MALL_BOARD(BOARD_NO, BOARD_REGDATE, BOARD_READCOUNT, BOARD_TYPE,"
				+ " BOARD_TITLE, BOARD_CONTENTS, "
				+ " BOARD_UCCURL, "
				+ " BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_FILE4, BOARD_FILE5,"
				+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, BOARD_CATEGORY, "
				+ " BOARD_USER_NO, BOARD_SATIS, BOARD_ITEM_NO, BOARD_GNO) "
				+ " values(board_seq.nextval, sysdate, 0, ?, "
				+ "	?, ?, "
				+ "	?, "
				+ "	?, ?, ?, ?, ?,"
				+ " ?, ?, ?, ?,"
				+ " ?, ?, ?, board_seq.nextval )";
				
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, vo.getBoardType());
		pstmt.setString(2, vo.getBoardTitle());
		pstmt.setString(3, vo.getBoardContents());
		pstmt.setString(4, vo.getUccURL());
		pstmt.setString(5, vo.getBoardFileName1());
		pstmt.setString(6, vo.getBoardFileName2());
		pstmt.setString(7, vo.getBoardFileName3());
		pstmt.setString(8, vo.getBoardFileName4());
		pstmt.setString(9, vo.getBoardFileName5());
		pstmt.setString(10, vo.getBoardPwd());
		pstmt.setString(11, vo.getSecret());
		pstmt.setString(12, vo.getUserName());
		pstmt.setString(13, vo.getBoardCategory());
		pstmt.setInt(14, vo.getBoardUserNo());
		pstmt.setDouble(15, vo.getBoardSatis());
		pstmt.setInt(16, vo.getBoardItemNo());
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	// 모든 Board 불러오기
	public ArrayList<BoardVO> getAllBoardList() throws SQLException{
		
		String sql = "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS,"
				+ " BOARD_UCCURL, BOARD_TYPE, "
				+ " BOARD_FILE1, BOARD_FILE2, "
				+ " BOARD_FILE3, BOARD_FILE4, BOARD_FILE5, "
				+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, "
				+ " BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY, "
				+ " BOARD_USER_NO, BOARD_SATIS, "
				+ " BOARD_ITEM_NO, BOARD_GNO"
					+ "	from MALL_BOARD"
					+ " order by BOARD_NO desc";
		
		ArrayList<BoardVO>  boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();		
		
		while(rs.next()) {
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setUccURL(rs.getString("BOARD_UCCURL"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			board.setBoardPwd(rs.getString("BOARD_PWD"));
			board.setSecret(rs.getString("BOARD_SECRET"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardUserNo(rs.getInt("BOARD_USER_NO"));
			board.setBoardSatis(rs.getDouble("BOARD_SATIS"));
			board.setBoardItemNo(rs.getInt("BOARD_ITEM_NO"));
			board.setBoardGroupNo(rs.getInt("BOARD_GNO"));
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return boardList;
	}
	
	// 공지사항 불러오기
	public ArrayList<BoardVO> getAllNotice() throws SQLException {
		final String sql = "select m.BOARD_CATEGORY,m.BOARD_CONTENTS,m.BOARD_FILE1,m.BOARD_FILE2,m.BOARD_FILE3,m.BOARD_FILE4,m.BOARD_FILE5,m.BOARD_NO,m.BOARD_PWD,m.BOARD_READCOUNT,m.BOARD_REGDATE,m.BOARD_SATIS,m.BOARD_SECRET,m.BOARD_TITLE,m.BOARD_TYPE,m.BOARD_UCCURL,m.BOARD_USER_NAME,m.BOARD_USER_NO from MALL_BOARD m where m.BOARD_TYPE IN 5 order by m.BOARD_REGDATE DESC";
		
		ArrayList<BoardVO>  noticeBoardList = new ArrayList<>();

		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();	
		
		while(rs.next()){
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			noticeBoardList.add(board);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return noticeBoardList;
	}
	
	public ArrayList<BoardVO> getAllFA() throws SQLException {
		final String sql = "select m.BOARD_CATEGORY,m.BOARD_CONTENTS,m.BOARD_FILE1,m.BOARD_FILE2,m.BOARD_FILE3,m.BOARD_FILE4,m.BOARD_FILE5,m.BOARD_NO,m.BOARD_PWD,m.BOARD_READCOUNT,m.BOARD_REGDATE,m.BOARD_SATIS,m.BOARD_SECRET,m.BOARD_TITLE,m.BOARD_TYPE,m.BOARD_UCCURL,m.BOARD_USER_NAME,m.BOARD_USER_NO from MALL_BOARD m where m.BOARD_TYPE IN 10 order by m.BOARD_REGDATE DESC";
		
		ArrayList<BoardVO>  noticeBoardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();	
		
		while(rs.next()){
			BoardVO board = new BoardVO();
			board.setBoardNo(rs.getInt("BOARD_NO"));
			board.setBoardTitle(rs.getString("BOARD_TITLE"));
			board.setUserName(rs.getString("BOARD_USER_NAME"));
			board.setBoardRegdate(rs.getTimestamp("BOARD_REGDATE"));
			board.setBoardReadCount(rs.getInt("BOARD_READCOUNT"));
			board.setBoardContents(rs.getString("BOARD_CONTENTS"));
			board.setBoardType(rs.getInt("BOARD_TYPE"));
			board.setBoardCategory(rs.getString("BOARD_CATEGORY"));
			board.setBoardFileName1(rs.getString("BOARD_FILE1"));
			board.setBoardFileName2(rs.getString("BOARD_FILE2"));
			board.setBoardFileName3(rs.getString("BOARD_FILE3"));
			board.setBoardFileName4(rs.getString("BOARD_FILE4"));
			board.setBoardFileName5(rs.getString("BOARD_FILE5"));
			noticeBoardList.add(board);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return noticeBoardList;
	}
	
	
}
