package horse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Alert;
import javafx.scene.control.TextField;
import javafx.scene.control.Alert.AlertType;
import javafx.stage.Modality;
import javafx.stage.Stage;
import util.ConnectionUtil;

public class UserDAO {
	
	private String userId;
	
	public ArrayList<UserVO> getAll(){
		ArrayList<UserVO> userList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con = ConnectionUtil.getConnection();
			String sql = "SELECT ID, PASSWORD "
					+ " FROM TB_USER";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				UserVO user = new UserVO();
				user.setId(rs.getString("ID"));
				user.setPwd(rs.getString("PASSWORD"));
				user.setName(rs.getString("NAME"));
				user.setPoint(rs.getInt("POINT"));
				
				userList.add(user);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (rs != null)	try {rs.close();} catch (SQLException e1) {System.err.println(e1.getMessage());}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e2) {System.err.println(e2.getMessage());}
			if (con != null)try {con.close();} catch (SQLException e3) {System.err.println(e3.getMessage());}
		}
		return userList;
	}

	
	public void join (String id, String pwd, String name){		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnectionUtil.getConnection();
			String sql = "INSERT INTO TB_USER "
					+ " VALUES(?, ?, ?, ?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);			
			pstmt.setInt(4, 0);
			pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (rs != null)	try {rs.close();} catch (SQLException e1) {System.err.println(e1.getMessage());}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e2) {System.err.println(e2.getMessage());}
			if (con != null)try {con.close();} catch (SQLException e3) {System.err.println(e3.getMessage());}
		}
		
	}	
	

	public String login(String id, String pwd) {
		userId = null;
		
		String GET_USERS = "select ID, PASSWORD"
				+ " from TB_USER where id = ? and password = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = ConnectionUtil.getConnection();
			pstmt = con.prepareStatement(GET_USERS);

			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			rs = pstmt.executeQuery();
						
			if (rs.next()) {
				while(rs.next()) {
					userId = rs.getString("id");
				}
				FXMLLoader loader = new FXMLLoader();
				loader.setLocation(this.getClass().getResource("Main.fxml"));
				Parent page = loader.load();
				Scene scene = new Scene(page);
				Stage dialogStage = new Stage();
				dialogStage.setTitle("로그인");
				dialogStage.initModality(Modality.WINDOW_MODAL);
				dialogStage.setScene(scene); 
				dialogStage.showAndWait();
			} else {
				Alert alert = new Alert(AlertType.WARNING);
				alert.setTitle("경고");
				alert.setHeaderText("오류");
				alert.setContentText("아이디 패스워드가 일치하지 않습니다.");
				alert.showAndWait();
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (rs != null)	try {rs.close();} catch (SQLException e1) {System.err.println(e1.getMessage());}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e2) {System.err.println(e2.getMessage());}
			if (con != null)try {con.close();} catch (SQLException e3) {System.err.println(e3.getMessage());}
		}
		return userId;
	}
	
	public int balanceCheck(String id) {
		int point = 0;
		id = userId;
		
		final String GET_USERS = "select POINT"
				+ " from TB_USER where ID = ?";
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ConnectionUtil.getConnection();
			pstmt = con.prepareStatement(GET_USERS);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				point = rs.getInt("POINT");
			}
		}
		catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (rs != null)	try {rs.close();} catch (SQLException e1) {System.err.println(e1.getMessage());}
			if (pstmt != null) try {pstmt.close();} catch (SQLException e2) {System.err.println(e2.getMessage());}
			if (con != null)try {con.close();} catch (SQLException e3) {System.err.println(e3.getMessage());}
		}
		return point;
	}

	public void charge(int charge, String id) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		id = userId;
		try { 
			con = ConnectionUtil.getConnection();
			String sql = "UPDATE TB_USER"
					+ "	SET POINT = ?"
					+ " WHERE ID = (SELECT ID FROM TB_USER WHERE ID = ?)";
			pstmt.setInt(1, charge);
			pstmt.setString(2, id);
			pstmt.executeUpdate(sql);
			
		} catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (SQLException e2) {System.err.println(e2.getMessage());}
			if (con != null)try {con.close();} catch (SQLException e3) {System.err.println(e3.getMessage());}
		}
	}
	
	public void chage(int no) {
	}
	public ArrayList<HorseVO> getAllHorse(){
		
		final String GET_ALL_HORSE = "SELECT * FROM TB_HORSE";
		
		ArrayList<HorseVO> horseList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {	
			con = ConnectionUtil.getConnection();
			pstmt = con.prepareStatement(GET_ALL_HORSE);
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()){
				HorseVO vo = new HorseVO();
				vo.setHorseName(rs.getString("NAME"));
				vo.setRate(rs.getDouble("WINRATE"));
				
				horseList.add(vo);
			}
		}catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (SQLException e2) {System.err.println(e2.getMessage());}
			if (con != null)try {con.close();} catch (SQLException e3) {System.err.println(e3.getMessage());}
		}
		return horseList;
	}

	public ArrayList<HorseStatus> getStatus(String horseName){
		
		final String GET_ALL_HORSE = "select *" + " from TB_HORSE" + " where NAME = ?";
		ArrayList<HorseStatus> HorseStatusList = new ArrayList<>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = ConnectionUtil.getConnection();
			pstmt = con.prepareStatement(GET_ALL_HORSE);
			pstmt.setString(1, horseName);
			ResultSet rs = pstmt.executeQuery();
		
			while(rs.next()){
			HorseStatus	hs = new HorseStatus();
				hs.setHorseName(rs.getString("NAME"));
				hs.setFirstforce(rs.getInt("FIRSTFORCE"));
				hs.setPushforce(rs.getInt("PUSHFORCE"));
				hs.setSpeed(rs.getInt("SPEED"));
				
				HorseStatusList.add(hs);
			}	
		}catch (Exception e) {
			e.printStackTrace();
			System.err.println(e.getMessage());
		} finally {
			if (pstmt != null) try {pstmt.close();} catch (SQLException e2) {System.err.println(e2.getMessage());}
			if (con != null)try {con.close();} catch (SQLException e3) {System.err.println(e3.getMessage());}
		}
		return HorseStatusList;
	}
	
	
}