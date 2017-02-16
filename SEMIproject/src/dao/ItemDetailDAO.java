package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.ItemVO;

public class ItemDetailDAO {
	
	public void setItemInformation(int cartUserNo, int itemNo, String cartCount, String color, String size)throws SQLException{
		
		String sql = "insert into mall_cart(cart_user_no, cart_item_no, cart_count, cart_regdate, cart_no,cart_item_color, cart_item_size)"
					+ " values(?, ?, ?, sysdate, seq_mall_cart_cart_no.nextval, ?, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cartUserNo);
		pstmt.setInt(2, itemNo);
		pstmt.setString(3, cartCount);
		pstmt.setString(4, color);
		pstmt.setString(5, size);
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}
	
	public ArrayList<ItemVO> getItemGroupNo(int groupNo)throws SQLException{
		
		String sql = "select item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no"
					+ " from mall_item"
					+ " where item_group_no= ?";
		
		ArrayList<ItemVO> itemList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, groupNo);
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
}
