package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.CartVO;
import vo.ItemVO;

public class ItemDAO {
	
	// 장바구니 삭제
	public void deleteCartItem(int cartNo) throws SQLException{
		
		String sql = "delete from TB_CART where cart_no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, cartNo);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	
	// 로그인 유저의 장바구니 조회하기
	public ArrayList<CartVO> getCartItemsByUser(String userId) throws SQLException{
		String sql = "select A.cart_no, B.item_no, B.item_name, B.item_maker,"
				+ " B.item_price, A.regdate "
				+ " from TB_CART A, TB_ITEM B "
				+ " where A.item_no = B.item_no "
				+ " and A.user_id = ?";
		
		ArrayList<CartVO> cartItems = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while(rs.next()) {
			CartVO cart = new CartVO();
			cart.setNo(rs.getInt("cart_no"));
			cart.setRegdate(rs.getDate("regdate"));
			
			ItemVO item = new ItemVO();
			item.setNo(rs.getInt("item_no"));
			item.setName(rs.getString("item_name"));
			item.setMaker(rs.getString("item_maker"));
			item.setPrice(rs.getInt("item_price"));
			
			cart.setItem(item);
			
			cartItems.add(cart);
		}
		
		// 아무것도 없으면 cartItems.size()는 0이 된다!!!
		
		rs.close();
		pstmt.close();
		con.close();
		
		return cartItems;
	}
	
	
	// 장바구니 추가
	public void addcart(int itemNo, String userId) throws SQLException{
		
		String sql = "insert into tb_cart(cart_no, item_no, user_id, regdate) "
				+ " values(comm_seq.nextval, ?, ?, sysdate)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, itemNo);
		pstmt.setString(2, userId);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();		
	}
	
	// 모든 상품 조회하기
	public ArrayList<ItemVO> getAllItems() throws SQLException {
		ArrayList<ItemVO> items = new ArrayList<>();

		String sql = "select item_no, item_name, item_maker, item_price, item_pubdate"
				+ " from TB_ITEM "
				+ " order by item_no asc";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		while(rs.next()) {
			ItemVO item = new ItemVO();
			item.setNo(rs.getInt("item_no"));
			item.setName(rs.getString("item_name"));
			item.setMaker(rs.getString("item_maker"));
			item.setPrice(rs.getInt("item_price"));
			item.setPubdate(rs.getDate("item_pubdate"));	
			items.add(item);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return items;
	}
	
}
