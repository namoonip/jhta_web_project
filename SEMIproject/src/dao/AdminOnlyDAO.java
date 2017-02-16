package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.BoardVO;
import vo.BuyVO;
import vo.ItemVO;
import vo.UserVO;

public class AdminOnlyDAO {

	// 모든 상품을 가져옵니다.
	public ArrayList<ItemVO> getAllProduct() throws SQLException{
		final String sql = "select m.ITEM_NO, m.ITEM_CATEGORY_NO, m.ITEM_NAME, m.ITEM_PRICE, m.ITEM_COUNT, m.ITEM_COLOR, m.ITEM_GROUP_NO, m.ITEM_SRC, m.ITEM_SIZE, m.ITEM_VIEWSRC, m.ITEM_ETC from MALL_ITEM m order BY m.ITEM_NO ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);

		ArrayList<ItemVO> itemList = new ArrayList<>();
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ItemVO item = new ItemVO();
			item.setName(rs.getString("ITEM_NAME"));
			item.setViewSrc(rs.getString("ITEM_VIEWSRC"));
			item.setItemNo(rs.getInt("ITEM_NO"));
			item.setSrc(rs.getString("ITEM_SRC"));
			item.setCount(rs.getInt("ITEM_COUNT"));
			item.setPrice(rs.getInt("ITEM_PRICE"));
			item.setColor(rs.getString("ITEM_COLOR"));
			item.setSize(rs.getString("ITEM_SIZE"));
			item.setGroupNo(rs.getInt("ITEM_GROUP_NO"));
			item.setEtc(rs.getString("ITEM_ETC"));
			item.setCategoryNo(rs.getInt("ITEM_CATEGORY_NO"));
			
			itemList.add(item);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return itemList;
	}
	
	// 모든 유저 정보 가져오기
	public ArrayList<UserVO> getAllUser() throws SQLException {
		final String sql = " select m.USER_NO, m.USER_ID, m.USER_PWD, m.USER_ADDRESS, m.USER_BIRTHDAY, m.USER_GRADE, m.USER_NAME, m.USER_PHONE, m.USER_POINT, m.USER_REGDATE, m.USER_TOTAL_POINT from MALL_USER m order BY m.USER_NO DESC ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);

		ArrayList<UserVO> userList = new ArrayList<>();
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			UserVO user = new UserVO();
			user.setId(rs.getString("USER_ID"));
			user.setName(rs.getString("USER_NAME"));
			user.setNo(rs.getInt("USER_NO"));
			user.setPw(rs.getString("USER_PWD"));
			user.setPhone(rs.getString("USER_PHONE"));
			user.setAddr(rs.getString("USER_ADDRESS"));
			user.setGrade(rs.getString("USER_GRADE"));
			user.setTotalPoint(rs.getInt("USER_TOTAL_POINT"));
			user.setPoint(rs.getInt("USER_POINT"));
			user.setRegdate(rs.getDate("USER_REGDATE"));
			user.setBirth(rs.getString("USER_BIRTHDAY"));
			
			userList.add(user);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return userList;
	}
	
	// 모든 게시글 가져오기
	public ArrayList<BoardVO> getAllBoard() throws SQLException{
			
			String sql = "select BOARD_NO, BOARD_TITLE, BOARD_CONTENTS,"
					+ " BOARD_UCCURL, BOARD_TYPE, "
					+ " BOARD_FILE1, BOARD_FILE2, "
					+ " BOARD_FILE3, BOARD_FILE4, BOARD_FILE5, "
					+ " BOARD_PWD, BOARD_SECRET, BOARD_USER_NAME, "
					+ " BOARD_REGDATE, BOARD_READCOUNT, BOARD_CATEGORY"
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
			boardList.add(board);
		}
		
		rs.close();
		pstmt.close();
		con.close();
			
		return boardList;
	}
	
	// 모든 구매정보 가져오기
	public ArrayList<BuyVO> getAllbuy() throws SQLException{
		final String sql = " select m.BUY_COMPLETED,m.BUY_DATE,m.BUY_DISCOUNT,m.BUY_ORDER_NO,m.BUY_USER_ID from MALL_BUY m ORDER BY m.BUY_ORDER_NO ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);		
		
		ArrayList<BuyVO> buyList = new ArrayList<>();
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			BuyVO buy = new BuyVO();
			buy.setBuyUserId(rs.getString("BUY_USER_ID"));
			buy.setBuyCompleted(rs.getString("BUY_COMPLETED"));
			buy.setBuyDay(rs.getDate("BUY_DATE"));
			buy.setBuyDiscount(rs.getInt("BUY_DISCOUNT"));
			buy.setBuyOrderNo(rs.getInt("BUY_ORDER_NO"));
			
			buyList.add(buy);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return buyList;
	}
	
	// 해당하는 상품 삭제하기
	public void productDelete(int no) throws SQLException{
		final String sql = "delete from MALL_ITEM m WHERE m.ITEM_NO = ?";
		
		Connection con = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		pstmt.executeQuery();
		
		pstmt.close();
		con.close();
	}
	
	// 유저 삭제하기
	public void userDelete(int no) throws SQLException{
		final String sql = " delete from MALL_USER u WHERE u.USER_NO = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		pstmt.executeQuery();
		
		pstmt.close();
		con.close();
		
	}
	
/*	// 상품번호로 이름 가져오기
	public String getItemName(int no) throws SQLException {
		final String sql = " select i.ITEM_NAME from MALL_BUY b, MALL_ITEM i where b.BUY_ITEM_NO = i.ITEM_NO AND b.BUY_ITEM_NO = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);	
		
		pstmt.setInt(1, no);
		
		String productName = "";
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			productName = rs.getString("ITEM_NAME");
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return productName;
	}
	
	// 유저 번호로 이름 가져오기
	public String getUserName(int no) throws SQLException {
		final String sql = " select u.USER_NAME from MALL_BUY b, MALL_USER u where b.BUY_USER_NO = u.USER_NO AND b.BUY_USER_NO = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);	
		
		pstmt.setInt(1, no);
		
		String userName = "";
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			userName = rs.getString("USER_NAME");
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return userName;
	}
	*/
	
	// 배송OK시 사용할것
	public void deliveryOK(int no) throws SQLException {
		final String sql = " update MALL_BUY SET BUY_COMPLETED = 'YES' where BUY_ORDER_NO = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);	
		
		pstmt.setInt(1, no);
		pstmt.executeQuery();
		
		pstmt.close();
		con.close();
	}
	
	// 상품목록 총 개수 구하기
	public int getTotalProductRows() throws SQLException {
		final String sql = " select count(*) cnt from MALL_ITEM ";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
 
        ResultSet rs = pstmt.executeQuery();
 
        if (rs.next()) {
            totalRows = rs.getInt("cnt");
        }
 
        return totalRows;
	}
	
	// 유저 총 개수 구하기
	public int getTotalUserRows() throws SQLException {
		
		final String sql = " select count(*) cnt from MALL_USER ";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
        PreparedStatement pstmt = con.prepareStatement(sql);
 
        ResultSet rs = pstmt.executeQuery();
 
        if (rs.next()) {
            totalRows = rs.getInt("cnt");
        }
 
        return totalRows;
	}

	// 게시판 총 개수 구하기
	public int getTotalBoardRows() throws SQLException {
		
		final String sql = " select count(*) cnt from MALL_BOARD ";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		return totalRows;
	}
	
	// 구매상품 총 개수 구하기
	public int getTotalPurchaseRows() throws SQLException {
		
		final String sql = " select count(*) cnt from MALL_BUY ";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		ResultSet rs = pstmt.executeQuery();
		
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		return totalRows;
	}
	
	// 상품 페이징 처리
	public ArrayList<ItemVO> getProductListForPaging(int begin, int end) throws SQLException {
		final String sql = " select ITEM_CATEGORY_NO, ITEM_COLOR, ITEM_COUNT, ITEM_ETC, ITEM_GROUP_NO, ITEM_NAME, ITEM_NO, ITEM_PRICE, ITEM_SIZE, ITEM_SRC, ITEM_VIEWSRC from ( select row_number() over (order by m.ITEM_NO desc) rn, m.ITEM_CATEGORY_NO,m.ITEM_COLOR,m.ITEM_COUNT,m.ITEM_ETC,m.ITEM_GROUP_NO,m.ITEM_NAME,m.ITEM_NO,m.ITEM_PRICE,m.ITEM_SIZE,m.ITEM_SRC,m.ITEM_VIEWSRC from MALL_ITEM m ) where rn >= ? and rn <= ? ";
		
		ArrayList<ItemVO> itemList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ItemVO item = new ItemVO();
			item.setName(rs.getString("ITEM_NAME"));
			item.setViewSrc(rs.getString("ITEM_VIEWSRC"));
			item.setItemNo(rs.getInt("ITEM_NO"));
			item.setSrc(rs.getString("ITEM_SRC"));
			item.setCount(rs.getInt("ITEM_COUNT"));
			item.setPrice(rs.getInt("ITEM_PRICE"));
			item.setColor(rs.getString("ITEM_COLOR"));
			item.setSize(rs.getString("ITEM_SIZE"));
			item.setGroupNo(rs.getInt("ITEM_GROUP_NO"));
			item.setEtc(rs.getString("ITEM_ETC"));
			item.setCategoryNo(rs.getInt("ITEM_CATEGORY_NO"));
			
			itemList.add(item);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return itemList;
	}
	
	// 유저 페이징 처리
	public ArrayList<UserVO> getUserListForPaging(int begin, int end) throws SQLException {
		final String sql = " select USER_ADDRESS,USER_BIRTHDAY,USER_GRADE,USER_ID,USER_NAME,USER_NO,USER_PHONE,USER_POINT,USER_PWD,USER_REGDATE,USER_TOTAL_POINT from ( select row_number() over (order by m.USER_NO desc) rn, m.USER_ADDRESS,m.USER_BIRTHDAY,m.USER_GRADE,m.USER_ID,m.USER_NAME,m.USER_NO,m.USER_PHONE,m.USER_POINT,m.USER_PWD,m.USER_REGDATE,m.USER_TOTAL_POINT from MALL_USER m ) where rn >= ? and rn <= ? ";
		
		ArrayList<UserVO> userList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			UserVO user = new UserVO();
			user.setId(rs.getString("USER_ID"));
			user.setName(rs.getString("USER_NAME"));
			user.setNo(rs.getInt("USER_NO"));
			user.setPw(rs.getString("USER_PWD"));
			user.setPhone(rs.getString("USER_PHONE"));
			user.setAddr(rs.getString("USER_ADDRESS"));
			user.setGrade(rs.getString("USER_GRADE"));
			user.setTotalPoint(rs.getInt("USER_TOTAL_POINT"));
			user.setPoint(rs.getInt("USER_POINT"));
			user.setRegdate(rs.getDate("USER_REGDATE"));
			user.setBirth(rs.getString("USER_BIRTHDAY"));
			
			userList.add(user);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return userList;
	}
	
	// 게시글 페이징 처리
	public ArrayList<BoardVO> getBoardListForPaging(int begin, int end) throws SQLException {
		final String sql = "select BOARD_CATEGORY,BOARD_CONTENTS,BOARD_FILE1,BOARD_FILE2,BOARD_FILE3,BOARD_FILE4,BOARD_FILE5,BOARD_NO,BOARD_PWD,BOARD_READCOUNT,BOARD_REGDATE,BOARD_SECRET,BOARD_TITLE,BOARD_TYPE,BOARD_UCCURL,BOARD_USER_NAME from ( select row_number() over (order by m.BOARD_NO desc) rn,m.BOARD_CATEGORY,m.BOARD_CONTENTS,m.BOARD_FILE1,m.BOARD_FILE2,m.BOARD_FILE3,m.BOARD_FILE4,m.BOARD_FILE5,m.BOARD_NO,m.BOARD_PWD,m.BOARD_READCOUNT,m.BOARD_REGDATE,m.BOARD_SECRET,m.BOARD_TITLE,m.BOARD_TYPE,m.BOARD_UCCURL,m.BOARD_USER_NAME from MALL_BOARD m ) where rn >= ? and rn <= ? ";
		
		ArrayList<BoardVO>  boardList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		
		
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
		boardList.add(board);
	}
	
	rs.close();
	pstmt.close();
	con.close();
		
	return boardList;
	}
	
	// 상품목록 페이징 처리
	public ArrayList<BuyVO> getPurchaseForPaging(int begin, int end) throws SQLException {
		final String sql = " select BUY_COMPLETED, BUY_DATE, BUY_DISCOUNT, BUY_ORDER_NO, BUY_USER_ID, ITEM_NAME, ITEM_COLOR, BUY_ITEM_COUNT, BUY_ITEM_ORDER_NUM from ( select row_number() over (order by m.BUY_ORDER_NO desc) rn,m.BUY_COMPLETED,m.BUY_DATE,m.BUY_DISCOUNT,m.BUY_ORDER_NO,m.BUY_USER_ID,m1.ITEM_NAME,m1.ITEM_COLOR,i.BUY_ITEM_COUNT,i.BUY_ITEM_ORDER_NUM from MALL_BUY m, MALL_BUY_ITEM i, MALL_ITEM m1 where m.BUY_ORDER_NO = i.BUY_ITEM_ORDER_NUM AND m1.ITEM_NO = i.BUY_ITEM_PRODUCT_NUM ) where rn >= ? and rn <= ? ";
		
		ArrayList<BuyVO> buyList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);		
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			BuyVO buy = new BuyVO();
			buy.setBuyUserId(rs.getString("BUY_USER_ID"));
			buy.setBuyCompleted(rs.getString("BUY_COMPLETED"));
			buy.setBuyDay(rs.getDate("BUY_DATE"));
			buy.setBuyDiscount(rs.getInt("BUY_DISCOUNT"));
			buy.setBuyOrderNo(rs.getInt("BUY_ORDER_NO"));
			buy.setItemname(rs.getString("ITEM_NAME"));
			buy.setItemcolor(rs.getString("ITEM_COLOR"));
			buy.setItemCount(rs.getInt("BUY_ITEM_COUNT"));
			buy.setItemOrderNum(rs.getInt("BUY_ITEM_ORDER_NUM"));
			
			buyList.add(buy);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return buyList;
	}
	
	
	// 게시판 삭제
	public void boardDelete(int no) throws SQLException {
		final String sql = " delete from MALL_BOARD b WHERE b.BOARD_NO = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setInt(1, no);
		pstmt.executeQuery();
		
		pstmt.close();
		con.close();
	}
	
	// 통계정보 가져오기
	public ArrayList<BuyVO> getAllStat() throws SQLException {
		final String sql = " select count(*) cnt, substr(m.BUY_DATE,1,5) month from MALL_BUY m group by substr(m.BUY_DATE,1,5) order by substr(m.BUY_DATE,1,5) "; 
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);		
		
		ArrayList<BuyVO> statList = new ArrayList<>();
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			BuyVO stat = new BuyVO();
			
			stat.setBuyUserId(rs.getString("cnt"));
			stat.setBuyCompleted(rs.getString("month"));
			
			statList.add(stat);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return statList;
	}
	
	public void addBoard(BoardVO board) throws SQLException{
		String sql = " insert into MALL_BOARD ( BOARD_TITLE, BOARD_CONTENTS, BOARD_USER_NAME, BOARD_TYPE, BOARD_CATEGORY, BOARD_FILE1, BOARD_FILE2, BOARD_FILE3, BOARD_FILE4, BOARD_FILE5, BOARD_USER_NO, BOARD_NO) VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, SEQ_MALL_BOARD_BOARD_NO.nextval)";
		 
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, board.getBoardTitle());
		pstmt.setString(2, board.getBoardContents());
		pstmt.setString(3, board.getUserName());
		pstmt.setInt(4, board.getBoardType());
		pstmt.setString(5, board.getBoardCategory());
		pstmt.setString(6, board.getBoardFileName1());
		pstmt.setString(7, board.getBoardFileName2());
		pstmt.setString(8, board.getBoardFileName3());
		pstmt.setString(9, board.getBoardFileName4());
		pstmt.setString(10, board.getBoardFileName5());
		pstmt.setInt(11, board.getBoardUserNo());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
}
