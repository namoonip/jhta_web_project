package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.GalVO;

public class GallDAO {
	
	public GalVO getGalVO(String userId) throws SQLException {
		
		String sql = "select no, title, description, filename, day, location"
				+ " from tb_gallery"
				+ " where user_id = ?";

		GalVO vo = new GalVO();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userId);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			vo.setNo(rs.getInt("no"));
			vo.setTitle(rs.getString("title"));
			vo.setDescription(rs.getString("description"));
			vo.setFilename(rs.getString("filename"));
			vo.setDay(rs.getString("day"));
			vo.setLocation(rs.getString("location"));
			vo.setUserId(userId);
		}		
		rs.close();
		pstmt.close();
		con.close();
		
		return vo;
	}
	
	public void addGal(GalVO gal) throws SQLException {
		
		String sql = "insert into tb_gallery (no, title, description, filename, day, location, user_id) "
				+ " values(comm_seq.nextval, ?, ?, ? ,?, ?, ?) ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, gal.getTitle());
		pstmt.setString(2, gal.getDescription());
		pstmt.setString(3, gal.getFilename());
		pstmt.setString(4, gal.getDay());
		pstmt.setString(5, gal.getLocation());
		pstmt.setString(6, gal.getUserId());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<GalVO> getAllUp(String userid) throws SQLException {
		
		String sql ="select no, title, filename, day, location, user_id, DESCRIPTION "
				+ " from tb_gallery "
				+ " where user_id = ?";
		
		ArrayList<GalVO> galList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, userid);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			GalVO vo = new GalVO();
			vo.setNo(rs.getInt("no"));
			vo.setTitle(rs.getString("title"));
			vo.setDescription(rs.getString("DESCRIPTION"));
			vo.setFilename(rs.getString("filename"));
			vo.setDay(rs.getString("day"));
			vo.setLocation(rs.getString("location"));
			vo.setUserId(rs.getString("user_id"));
			
			galList.add(vo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		return galList;
	}
	
	public void deleteFile(int no) throws SQLException{		
		String sql = "delete from tb_gallery"
				+ " where no = ? ";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, no);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();		
	}
	
}