package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import util.ConnectionUtil;
import vo.ItemVO;

public class MainDAO {
	
	
	public ItemVO getItemListDetail(int no)throws SQLException{
		
		String sql = "select item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no"
					+ " from mall_item"
					+ " where item_no = ?";
		
		ItemVO item = null;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			item = new ItemVO();
			
			item.setName(rs.getString("item_name"));
			item.setViewSrc(rs.getString("item_viewsrc"));
			item.setItemNo(rs.getInt("item_no"));
			item.setSrc(rs.getString("item_src"));
			item.setCount(rs.getInt("item_count"));
			item.setPrice(rs.getInt("item_price"));
			item.setColor(rs.getString("item_color"));
			item.setSize(rs.getString("item_size"));
			item.setGroupNo(rs.getInt("item_group_no"));
			item.setEtc(rs.getString("item_etc"));
			item.setCategoryNo(rs.getInt("item_category_no"));
			
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return item;
	}
	
	
	
	
	public ArrayList<ItemVO> getItemNewPageList(int begin, int end)throws SQLException{
		
		final String sql = " select ITEM_CATEGORY_NO, ITEM_COLOR, ITEM_COUNT, ITEM_ETC, ITEM_GROUP_NO, ITEM_NAME, ITEM_NO, ITEM_PRICE, ITEM_REGDATE, ITEM_SIZE, ITEM_SRC, ITEM_VIEWSRC, ITEM_REGDATE from ( select row_number() over (order by m.ITEM_REGDATE desc) rn, m.ITEM_CATEGORY_NO,m.ITEM_COLOR,m.ITEM_COUNT,m.ITEM_ETC,m.ITEM_GROUP_NO,m.ITEM_NAME,m.ITEM_NO,m.ITEM_PRICE,m.ITEM_REGDATE,m.ITEM_SIZE,m.ITEM_SRC,m.ITEM_VIEWSRC from mall_item m ) where rn >= ? and rn<= ? ";
					
		ArrayList<ItemVO> itemList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			ItemVO item = new ItemVO();
			item.setName(rs.getString("item_name"));
			item.setViewSrc(rs.getString("item_viewsrc"));
			item.setItemNo(rs.getInt("item_no"));
			item.setSrc(rs.getString("item_src"));
			item.setCount(rs.getInt("item_count"));
			item.setPrice(rs.getInt("item_price"));
			item.setColor(rs.getString("item_color"));
			item.setSize(rs.getString("item_size"));
			item.setGroupNo(rs.getInt("item_group_no"));
			item.setEtc(rs.getString("item_etc"));
			item.setCategoryNo(rs.getInt("item_category_no"));
			item.setRegdate(rs.getDate("item_regdate"));
			
			itemList.add(item);
		}
		rs.close();
		pstmt.close();
		con.close();
		return itemList;
	}
	
public ArrayList<ItemVO> getItemBestPageList(int begin, int end)throws SQLException{
		
		String sql ="select item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no "
					+ " from (select row_number() over (order by item_no desc) rn,"
					+ " item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no"
					+ "	from mall_item"
					+ " where item_no in (SELECT  buy_item_product_num"
					+" from(select buy_item_product_num ,count(*)"
					+" from mall_buy_item"
					+" group by buy_item_product_num"
					+" order by count(*) desc)"
					+" WHERE ROWNUM <= 6))"
					+" where rn>=? and rn<= ?";
					
		

		ArrayList<ItemVO> itemList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, begin);
		pstmt.setInt(2, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			ItemVO item = new ItemVO();
			item.setName(rs.getString("item_name"));
			item.setViewSrc(rs.getString("item_viewsrc"));
			item.setItemNo(rs.getInt("item_no"));
			item.setSrc(rs.getString("item_src"));
			item.setCount(rs.getInt("item_count"));
			item.setPrice(rs.getInt("item_price"));
			item.setColor(rs.getString("item_color"));
			item.setSize(rs.getString("item_size"));
			item.setGroupNo(rs.getInt("item_group_no"));
			item.setEtc(rs.getString("item_etc"));
			item.setCategoryNo(rs.getInt("item_category_no"));
			
			itemList.add(item);
		}
		rs.close();
		pstmt.close();
		con.close();
		return itemList;
	}
	
	

	public int getTotalRows()throws SQLException{
		
		String sql = "select count(*) cnt from mall_item";
		
		int totalRows = 0;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			totalRows = rs.getInt("cnt");
		}
		rs.close();
		pstmt.close();
		con.close();
		return totalRows;				
	}
}
