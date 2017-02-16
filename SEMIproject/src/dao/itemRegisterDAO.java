package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.ItemVO;

public class itemRegisterDAO {
	
	public int getItemByNo(int itemNo) throws SQLException {
		
		String sql = "select ITEM_COUNT from mall_item where item_no = ?";
		int count = 0;
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement psmt = con.prepareStatement(sql);
		psmt.setInt(1, itemNo);
		ResultSet rs = psmt.executeQuery();
		
		while (rs.next()) {
			
			count = rs.getInt("ITEM_COUNT");
			
		}
		
		rs.close();
		psmt.close();
		con.close();
		
		return count;
		
		
	}
	
	public ArrayList<ItemVO> getItemSrc()throws SQLException{
		
		String sql = "select item_no, item_category_no, item_viewsrc, item_name, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc"
					+ " from mall_item"
					+ " order by item_no desc";
		
		ArrayList<ItemVO> itemList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
	
		while(rs.next()){
			ItemVO item = new ItemVO();
			item.setItemNo(rs.getInt("item_no"));
			item.setCategoryNo(rs.getInt("item_category_no"));
			item.setViewSrc(rs.getString("item_viewsrc"));
			item.setName(rs.getString("item_name"));
			item.setSrc(rs.getString("item_src"));
			item.setPrice(rs.getInt("item_count"));
			item.setColor(rs.getString("item_color"));
			item.setSize(rs.getString("item_size"));
			item.setGroupNo(rs.getInt("item_group_no"));
			item.setEtc(rs.getString("item_etc"));
			
			itemList.add(item);
		}
		rs.close();
		pstmt.close();
		con.close();
		return itemList;		
	}
	

	public void addItemRegister(ItemVO item)throws SQLException{
		
		String sql = "insert into mall_item(item_no, item_category_no, item_viewsrc, item_name, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc)"
					+ " values(item_seq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, item.getCategoryNo());
		pstmt.setString(2, item.getViewSrc());
		pstmt.setString(3, item.getName());
		pstmt.setString(4, item.getSrc());
		pstmt.setInt(5, item.getCount());
		pstmt.setInt(6, item.getPrice());
		pstmt.setString(7, item.getColor());
		pstmt.setString(8, item.getSize());
		pstmt.setInt(9, item.getGroupNo());
		pstmt.setString(10, item.getEtc());
		
		pstmt.executeUpdate();
		pstmt.close();
		con.close();
	}

}
