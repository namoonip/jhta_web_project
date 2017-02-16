package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.BuyVO;
import vo.ItemVO;
import vo.SalesNumVO;
import vo.StatisticsVO;
import vo.groupItemVO;

public class StatisticsDAO {
	
	
	public ArrayList<SalesNumVO> getAllStat() throws SQLException {
		
		
				String sql = "select month, sum(count) num"
							+" from ( select B.buy_item_count count , substr(m.BUY_DATE,1,5) month" 
							+" from mall_item A, mall_buy_item B,MALL_BUY m" 
							+" where A.item_no = B.buy_item_product_num AND m.BUY_ORDER_NO = B.BUY_ITEM_ORDER_NUM)"
							+" group by month"
							+ " order by month";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);		
		
		ArrayList<SalesNumVO> statList = new ArrayList<>();
		
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			SalesNumVO statitics = new SalesNumVO();
			statitics.setSum(rs.getInt("num"));
			statitics.setDate(rs.getString("month"));
			
			
			
			statList.add(statitics);
		}
		rs.close();
		pstmt.close();
		con.close();
		
		return statList;
	}
	
	
	
	
	
	
	
	public ArrayList<groupItemVO>groupItemTotalList()throws SQLException{
		
		String sql = 	"select categoryname, sum(buyitemcount) sum"
						+" from(select C.category_name categoryname, B.buy_item_count buyitemcount,substr(D.BUY_DATE,1,2)"
						+" from mall_item A, mall_buy_item B, mall_category C, mall_buy D"
						+" where A.item_category_no = C.category_no and B.buy_item_product_num = A.item_no AND D.buy_order_no = B.buy_item_order_num and substr(D.BUY_DATE,1,2) = substr(sysdate,1,2))"
						+" group by categoryname";
		
		ArrayList<groupItemVO> groupList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			groupItemVO groupItem = new groupItemVO();
			
			groupItem.setCategoryname(rs.getString("categoryname"));
			groupItem.setSum(rs.getInt("sum"));
			
			groupList.add(groupItem);
		}
		rs.close();
		pstmt.close();
		con.close();
		return groupList;
		
	}
	
	
	public ArrayList<StatisticsVO> getItemTotalList()throws SQLException{
		
		
	
		String sql = " select sum(total) totalprice ,month"
					+" from ( select (A.item_price*B.buy_item_count) total, substr(m.BUY_DATE,1,5) month from mall_item A, mall_buy_item B,MALL_BUY m where A.item_no = B.buy_item_product_num AND m.BUY_ORDER_NO = B.BUY_ITEM_ORDER_NUM ORDER BY month)"
					+" group by month"
					+" order by  month";

		
		ArrayList<StatisticsVO> statisticsList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()){
			StatisticsVO statistics = new StatisticsVO();
			statistics.setSum(rs.getInt("totalprice"));
			statistics.setDate(rs.getString("month"));
			
			statisticsList.add(statistics);
			
		}
		rs.close();
		pstmt.close();
		con.close();
		return statisticsList;
	}

	public ArrayList<ItemVO> getItemBestItemList(int begin, int end)throws SQLException{
			
			String sql ="select item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no "
						+ " from (select row_number() over (order by item_no desc) rn,"
						+ " item_name, item_viewsrc, item_no, item_src, item_count, item_price, item_color, item_size, item_group_no, item_etc, item_category_no"
						+ "	from mall_item"
						+ " where item_no in (SELECT  buy_item_product_num"
						+" from(select buy_item_product_num ,count(*)"
						+" from mall_buy_item"
						+" group by buy_item_product_num"
						+" order by count(*) desc)"
						+" WHERE ROWNUM <= 10))"
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
