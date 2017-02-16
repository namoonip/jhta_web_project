package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.CartVO;
import vo.ItemVO;
import vo.UserVO;

public class CartDAO {
	
	static final String CART_VEIW = "select a.USER_NO,a.USER_BIRTHDAY, a.USER_NAME, a.USER_ID, a.USER_PWD, a.USER_PHONE, a.USER_ADDRESS, a.USER_GRADE, a.USER_TOTAL_POINT, a.USER_POINT,a.USER_REGDATE, b.CART_NO, b.CART_ITEM_COLOR, b.CART_ITEM_SIZE, b.CART_REGDATE, b.CART_COUNT, c.ITEM_NO, c.ITEM_CATEGORY_NO, c.ITEM_VIEWSRC, c.ITEM_NAME, c.ITEM_SRC, c.ITEM_COUNT, c.ITEM_PRICE, c.ITEM_ETC, c.ITEM_COLOR, c.ITEM_SIZE, c.ITEM_GROUP_NO"
			 + " from MALL_USER a,MALL_CART b,MALL_ITEM c"
			 + " where a.USER_NO = b.CART_USER_NO"
			 + " and c.ITEM_NO = b.CART_ITEM_NO"
			 + " and a.user_no = ?";
	
	static final String FINAL_CART = "select a.USER_NO,a.USER_BIRTHDAY, a.USER_NAME, a.USER_ID, a.USER_PWD, a.USER_PHONE, a.USER_ADDRESS, a.USER_GRADE, a.USER_TOTAL_POINT, a.USER_POINT,a.USER_REGDATE, b.CART_NO, b.CART_ITEM_COLOR, b.CART_ITEM_SIZE, b.CART_REGDATE, b.CART_COUNT, c.ITEM_NO, c.ITEM_CATEGORY_NO, c.ITEM_VIEWSRC, c.ITEM_NAME, c.ITEM_SRC, c.ITEM_COUNT, c.ITEM_PRICE, c.ITEM_ETC, c.ITEM_COLOR, c.ITEM_SIZE, c.ITEM_GROUP_NO"
			 + " from MALL_USER a,MALL_CART b,MALL_ITEM c"
			 + " where a.USER_NO = b.CART_USER_NO"
			 + " and c.ITEM_NO = b.CART_ITEM_NO"
			 + " and a.USER_NO = ?"
			 + " and b.CART_NO = ?";
	
	static final String DELETE_CART = "DELETE MALL_CART"
								   + " WHERE CART_NO = ?";
	
	public ArrayList<CartVO> testCart(int userNo) throws SQLException{
	
		ArrayList<CartVO> cartList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(CART_VEIW);
		ps.setInt(1,userNo);
		ResultSet rs = ps.executeQuery();
		
		ItemVO item = null;
		CartVO cart = null;
		UserVO user = null;
		
		while (rs.next()) {
		
			user = new UserVO();
			cart = new CartVO();
			item = new ItemVO();
			
			item.setItemNo(rs.getInt("ITEM_NO"));
			item.setCategoryNo(rs.getInt("ITEM_CATEGORY_NO"));
			item.setViewSrc(rs.getString("ITEM_VIEWSRC"));
			item.setName(rs.getString("ITEM_NAME"));
			item.setSrc(rs.getString("ITEM_SRC"));
			item.setCount(rs.getInt("ITEM_COUNT"));
			item.setPrice(rs.getInt("ITEM_PRICE"));
			item.setColor(rs.getString("ITEM_COLOR"));
			item.setSize(rs.getString("ITEM_SIZE"));
			item.setGroupNo(rs.getInt("ITEM_GROUP_NO"));
			item.setEtc(rs.getString("ITEM_ETC"));
			
			user.setNo(rs.getInt("USER_NO"));
			user.setBirth(rs.getString("USER_BIRTHDAY"));
			user.setName(rs.getString("USER_NAME"));
			user.setId(rs.getString("USER_ID"));
			user.setPw(rs.getString("USER_PWD"));
			user.setPhone(rs.getString("USER_PHONE"));
			user.setAddr(rs.getString("USER_ADDRESS"));
			user.setGrade(rs.getString("USER_GRADE"));
			user.setTotalPoint(rs.getInt("USER_TOTAL_POINT"));
			user.setPoint(rs.getInt("USER_POINT"));
			user.setRegdate(rs.getDate("USER_REGDATE"));
			
			cart.setItem(item);
			cart.setUser(user);
			cart.setCartNo(rs.getInt("CART_NO"));
			cart.setColor(rs.getString("CART_ITEM_COLOR"));
			cart.setSize(rs.getString("CART_ITEM_SIZE"));
			cart.setCount(rs.getString("CART_COUNT"));
			
			cartList.add(cart);
		
		}
		
		rs.close();
		ps.close();
		con.close();
		
		return cartList;
	}
	
	public ArrayList<CartVO> finalCart(int userNo, int cartNo) throws SQLException{
		
		ArrayList<CartVO> cartList = new ArrayList<>();
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(FINAL_CART);
		ps.setInt(1, userNo);
		ps.setInt(2, cartNo);
		ResultSet rs = ps.executeQuery();
		
		ItemVO item = null;
		CartVO cart = null;
		UserVO user = null;
		
		while (rs.next()) {
			
			user = new UserVO();
			cart = new CartVO();
			item = new ItemVO();
			
			item.setItemNo(rs.getInt("ITEM_NO"));
			item.setCategoryNo(rs.getInt("ITEM_CATEGORY_NO"));
			item.setViewSrc(rs.getString("ITEM_VIEWSRC"));
			item.setName(rs.getString("ITEM_NAME"));
			item.setSrc(rs.getString("ITEM_SRC"));
			item.setCount(rs.getInt("ITEM_COUNT"));
			item.setPrice(rs.getInt("ITEM_PRICE"));
			item.setColor(rs.getString("ITEM_COLOR"));
			item.setSize(rs.getString("ITEM_SIZE"));
			item.setGroupNo(rs.getInt("ITEM_GROUP_NO"));
			item.setEtc(rs.getString("ITEM_ETC"));
			
			user.setNo(rs.getInt("USER_NO"));
			user.setBirth(rs.getString("USER_BIRTHDAY"));
			user.setName(rs.getString("USER_NAME"));
			user.setId(rs.getString("USER_ID"));
			user.setPw(rs.getString("USER_PWD"));
			user.setPhone(rs.getString("USER_PHONE"));
			user.setAddr(rs.getString("USER_ADDRESS"));
			user.setGrade(rs.getString("USER_GRADE"));
			user.setTotalPoint(rs.getInt("USER_TOTAL_POINT"));
			user.setPoint(rs.getInt("USER_POINT"));
			user.setRegdate(rs.getDate("USER_REGDATE"));
			
			cart.setItem(item);
			cart.setUser(user);
			cart.setCartNo(rs.getInt("CART_NO"));
			cart.setColor(rs.getString("CART_ITEM_COLOR"));
			cart.setSize(rs.getString("CART_ITEM_SIZE"));
			
			
			cartList.add(cart);
			
		}
		
		rs.close();
		ps.close();
		con.close();
		
		return cartList;
		
	}
	
	public void deleteCart(int cartNo) throws SQLException{
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(DELETE_CART);
		ps.setInt(1, cartNo);
		
		ps.executeUpdate();
		
		ps.close();
		con.close();
	}
	
	
}
