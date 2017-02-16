package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.ItemVO;

public class thumbnailDAO {
	
	
	public ArrayList<ItemVO> getItemTotalPageList(int categoryNo, int begin, int end)throws SQLException{
		
		String sql ="select item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no, item_regdate "
					+ " from (select row_number() over (order by item_regdate desc) rn,"
					+ " item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no, item_regdate"
					+ "	from mall_item"
					+ "	where item_category_no= ?)"
					+ " where rn>=? and rn<= ?";
					
		ArrayList<ItemVO> itemList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, categoryNo);
		pstmt.setInt(2, begin);
		pstmt.setInt(3, end);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			ItemVO item = new ItemVO();
			item.setRegdate(rs.getDate("item_regdate"));
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
	
	public int getTotalRows(int categoryNo)throws SQLException{
		
		String sql = "select count(*) cnt"
					+ " from mall_item"
					+ " group by item_category_no "
					+ " having item_category_no = ?";
		
		int totalRows = 0;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, categoryNo);
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
