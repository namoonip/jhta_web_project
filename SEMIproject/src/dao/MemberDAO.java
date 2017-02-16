package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.UserVO;
import vo.orderlistVO;

public class MemberDAO {
	
	// 비밀번호 찾기
	public void userinfoById(String id, String pwd) throws SQLException {
		
		String sql = " update mall_user set user_pwd=? where user_id=?";
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, pwd);
		ps.setString(2, id);

		ps.executeUpdate();

		ps.close();
		con.close();
			
	}
	
	// 회원번호로 회원 찾기
	public UserVO getUserByNo(int no) throws SQLException {

		String sql = " select user_id, user_pwd, user_name, user_phone, user_birthday,user_point, user_address, user_grade, user_total_point, user_regdate"
				+ " from MALL_USER where user_no = ?";

		UserVO user = null;

		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setInt(1, no);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			user = new UserVO();

			user.setNo(no);
			user.setId(rs.getString("user_id"));
			user.setPw(rs.getString("user_pwd"));
			user.setName(rs.getString("user_name"));
			user.setPhone(rs.getString("user_phone"));
			user.setBirth(rs.getString("user_birthday"));
			user.setAddr(rs.getString("user_address"));
			user.setGrade(rs.getString("user_grade"));
			user.setPoint(rs.getInt("user_point"));
			
			user.setTotalPoint(rs.getInt("user_total_point"));
			user.setRegdate(rs.getDate("user_regdate"));

		}

		rs.close();
		ps.close();
		con.close();

		return user;
	}

	// 회원가입 디비에 저장하기
	public void join(UserVO user) throws SQLException {
		String sql = " insert into MALL_USER (USER_NO, USER_ID, USER_PWD, USER_NAME, USER_PHONE, USER_BIRTHDAY, USER_ADDRESS, USER_GRADE, USER_POINT, USER_TOTAL_POINT, USER_REGDATE, EMAILCHECK, EMAIL_CODE)"
				+ " values(comm_seq.nextval, ?, ?, ?, ?, ?, ?, 'Silver', 0, 0, sysdate, 'N', ? ) ";

		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, user.getId());
		ps.setString(2, user.getPw());
		ps.setString(3, user.getName());
		ps.setString(4, user.getPhone());
		ps.setString(5, user.getBirth());
		ps.setString(6, user.getAddr());
		ps.setString(7, user.getEmailcode());

		ps.executeUpdate();

		ps.close();
		con.close();
	}

	// 아이디로 로그인 체크하기
	public UserVO getUserById(String id) throws SQLException {

		String sql = " select user_no, user_id, user_pwd, user_name, user_phone, user_birthday, user_address, user_grade, user_point, user_total_point, user_regdate, EMAILCHECK, EMAIL_CODE"
				+ " from MALL_USER where user_id = ?";

		UserVO user = null;

		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		while (rs.next()) {
			user = new UserVO();

			user.setNo(rs.getInt("user_no"));
			user.setId(rs.getString("user_id"));
			user.setPw(rs.getString("user_pwd"));
			user.setName(rs.getString("user_name"));
			user.setPhone(rs.getString("user_phone"));
			user.setBirth(rs.getString("user_birthday"));
			user.setAddr(rs.getString("user_address"));
			user.setGrade(rs.getString("user_grade"));
			user.setPoint(rs.getInt("user_point"));
			user.setTotalPoint(rs.getInt("user_total_point"));
			user.setRegdate(rs.getDate("user_regdate"));
			user.setEmailcheck(rs.getString("EMAILCHECK"));
			user.setEmailcode(rs.getString("EMAIL_CODE"));
		}

		rs.close();
		ps.close();
		con.close();

		return user;
	}

	// 아이디 중복체크
	public int idCheck(String id) throws SQLException {
		String sql = " select count(*) as n from mall_user where user_id=?";

		int cnt = 0;
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, id);
		ResultSet rs = ps.executeQuery();

		if (rs.next()) {
			cnt = rs.getInt("n");

		}
		rs.close();
		ps.close();
		con.close();

		return cnt;
	}

	// 내 정보 수정하기
	public void updateUserInfo(UserVO user) throws SQLException {
		String sql = " update mall_user set user_pwd=?, user_phone=?, user_birthday=?, user_address=? where user_no = ?";

		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1, user.getPw());
		ps.setString(2, user.getPhone());
		ps.setString(3, user.getBirth());
		ps.setString(4, user.getAddr());
		ps.setInt(5, user.getNo());

		ps.executeUpdate();

		ps.close();
		con.close();
	}
	
	// 결제 조회하기
	public ArrayList<orderlistVO> getOrderlist(UserVO user) throws SQLException {
		
		String sql =" select user_id, order_date, order_no, product_name, product_size, product_color,product_count, product_price, delivering, point, total_point "
				+ "from user_orderlist_view "
				+ "where user_id=? "
				+ "order by order_date desc";

		ArrayList<orderlistVO> orderlist = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps= con.prepareStatement(sql);
		
		ps.setString(1, user.getId());
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			orderlistVO vo = new orderlistVO();
			
			
			vo.setUser_id(rs.getString("user_id"));
			vo.setOrder_date(rs.getString("order_date"));
			vo.setOrder_no(rs.getInt("order_no"));
			vo.setProduct_name(rs.getString("product_name"));
			vo.setProduct_size(rs.getString("product_size"));
			vo.setProduct_color(rs.getString("product_color"));
			vo.setProduct_count(rs.getInt("product_count"));
			vo.setProduct_price(rs.getInt("product_price"));
			vo.setDelivering(rs.getString("delivering"));
			vo.setPoint(rs.getInt("point"));
			vo.setTotal_point(rs.getInt("total_point"));
			
			orderlist.add(vo);		
		}
		rs.close();
		ps.close();
		con.close();

		return orderlist;
	
	}
	
	// 이메일 인증 여부 
	public void verifyEmail(String code) throws SQLException {
		String sql = " update mall_user set emailcheck = 'Y' where email_code = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps= con.prepareStatement(sql);
		
		ps.setString(1, code);
		
		ps.executeUpdate();
		ps.close();
		con.close();		
	}
	
	// 날짜별 구매내역 조회하기	
	public ArrayList<orderlistVO> getOrderlistByDate(String id, String begin, String end) throws SQLException{
		String sql = " select user_id, order_date, order_no, product_name, product_size, product_color,product_count, product_price, delivering, point, total_point "
						+ "from user_orderlist_view "
						+ "where to_char(order_date, 'yyyy-mm-dd')>=? and to_char(order_date, 'yyyy-mm-dd')<=? and user_id = ?";
		
		ArrayList<orderlistVO> orderlist = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setString(1, begin);
		ps.setString(2, end);	
		ps.setString(3, id);
		
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			orderlistVO vo = new orderlistVO();
			
			vo.setUser_id(rs.getString("user_id"));
			vo.setOrder_date(rs.getString("order_date"));
			vo.setOrder_no(rs.getInt("order_no"));
			vo.setProduct_name(rs.getString("product_name"));
			vo.setProduct_size(rs.getString("product_size"));
			vo.setProduct_color(rs.getString("product_color"));
			vo.setProduct_count(rs.getInt("product_count"));
			vo.setProduct_price(rs.getInt("product_price"));
			vo.setDelivering(rs.getString("delivering"));
			vo.setPoint(rs.getInt("point"));
			vo.setTotal_point(rs.getInt("total_point"));
			
			orderlist.add(vo);		
		}		
		rs.close();
		ps.close();
		con.close();
		
		return orderlist;		
	}

}
