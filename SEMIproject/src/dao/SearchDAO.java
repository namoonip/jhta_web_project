package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.ItemVO;

public class SearchDAO {

	public SearchDAO(){
		
		
	}
	
	// 찾은 아이템의 수량
	public int getFindItemRows(String itemName) throws SQLException {
		
		final String sql = " select count(*) cnt from MALL_ITEM m where m.ITEM_NAME like '%'||?||'%' ";
		
		int totalRows = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, itemName);
		
		ResultSet rs = pstmt.executeQuery();
		if (rs.next()) {
			totalRows = rs.getInt("cnt");
		}
		
		return totalRows;
	}
	
	//실제 아이템 찾는 로직 + 페이징
	public ArrayList<ItemVO> getFindItemForPaging(int begin, int end,String itemName) throws SQLException{
		
		final String sql = " select ITEM_CATEGORY_NO, ITEM_COLOR, ITEM_COUNT, ITEM_ETC, ITEM_GROUP_NO, iname, ITEM_NO, ITEM_PRICE, ITEM_SIZE, ITEM_SRC, ITEM_VIEWSRC from ( select row_number() over (order by m.ITEM_NO desc) rn, m.ITEM_CATEGORY_NO,m.ITEM_COLOR,m.ITEM_COUNT,m.ITEM_ETC,m.ITEM_GROUP_NO,UPPER(m.ITEM_NAME) iname,m.ITEM_NO,m.ITEM_PRICE,m.ITEM_SIZE,m.ITEM_SRC,m.ITEM_VIEWSRC from MALL_ITEM m where UPPER(m.ITEM_NAME) like UPPER('%'||?||'%')) where rn >= ? and rn <= ? ";

		ArrayList<ItemVO> itemList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1, itemName);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
				
		ResultSet rs = pstmt.executeQuery();
		while (rs.next()) {
			ItemVO item = new ItemVO();
			item.setName(rs.getString("iname"));
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
	
}
