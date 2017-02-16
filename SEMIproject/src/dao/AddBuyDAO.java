package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;

public class AddBuyDAO {
	
	static final String ADD_BUY_MALL = "insert into MALL_BUY values (?,'NO',SYSDATE,?,?)";
	
	static final String ADD_BUY_ITEM = "insert into MALL_BUY_ITEM VALUES (buy_seq.nextval,?,?,?,?,?)";
	
	static final String ORDER_NO = "select addBuy_seq.nextval from dual";
	
	static final String ADD_USE_POINT = "insert into MALL_PAY (PAY_POINT,PAY_ORDER_NO) VALUES (?,?)";
	
	static final String UPDATE_PRODUCT_COUNT = "update MALL_ITEM SET ITEM_COUNT = ? where ITEM_NO = ?";
	
	static final String DELETE_CART_BY_ITEMNO = "delete from MALL_CART where CART_ITEM_NO = ?";
	
	public void addBuyMall(String userId,double discount,int orderNo)throws SQLException {
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(ADD_BUY_MALL);
		ps.setString(1, userId);
		ps.setDouble(2, discount);
		ps.setInt(3, orderNo);
		ps.executeUpdate();
		
		ps.close();
		con.close();
	}
	
	public void addBuyItem(int itemNo,int itemCount, int orderNo, String size, String color) throws SQLException{
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(ADD_BUY_ITEM);
		ps.setInt(1, itemNo);
		ps.setInt(2, itemCount);
		ps.setInt(3, orderNo);
		ps.setString(4, size);
		ps.setString(5, color);
		
		ps.executeUpdate();
		
		ps.close();
		con.close();
	}
	
	public void addUsePoint (int usePoint,int orderNo) throws SQLException{
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(ADD_USE_POINT);
		ps.setInt(1, usePoint);
		ps.setInt(2, orderNo);
		
		ps.executeUpdate();
		
		ps.close();
		con.close();
		
	}
	
	public int orderNo () throws SQLException{
		
		Connection con =ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(ORDER_NO);
		int orderNo = 0;
		ResultSet rs = ps.executeQuery();
		
		if (rs.next()) {
			orderNo = rs.getInt("NEXTVAL");
		}
		
		rs.close();
		ps.close();
		con.close();
		return orderNo;
		
	}
	
	public void updateProductCount (int itemNo, int count) throws SQLException{
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(UPDATE_PRODUCT_COUNT);
		ps.setInt(1, count);
		ps.setInt(2, itemNo);
		
		ps.executeUpdate();
		
		ps.close();
		con.close();
		
	}
	
	public void deleteCart (int itemNo) throws SQLException {
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(DELETE_CART_BY_ITEMNO);
		ps.setInt(1, itemNo);
		
		ps.executeUpdate();
		
		ps.close();
		con.close();
		
	}
}
