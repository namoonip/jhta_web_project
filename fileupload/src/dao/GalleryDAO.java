package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;
import vo.GalleryVO;

public class GalleryDAO {
	
	public void addGallery(GalleryVO vo) throws SQLException {
		
		String sql = "insert into tb_gallery (no, username, description, filename)"
				+ " values(comm_seq.nextval, ?, ?, ?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo.getUsername());
		pstmt.setString(2, vo.getDescription());
		pstmt.setString(3, vo.getFilename());
		
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
	}
	
	public ArrayList<GalleryVO> getAllGallery() throws SQLException {
		
		String sql = "select no, username, description, filename "
				+ " from tb_gallery "
				+ " order by no desc";
		
		ArrayList<GalleryVO> galleryList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();
		
		while (rs.next()) {
			GalleryVO vo = new GalleryVO();
			vo.setNo(rs.getInt("no"));
			vo.setUsername(rs.getString("username"));
			vo.setDescription(rs.getString("description"));
			vo.setFilename(rs.getString("filename"));
			
			galleryList.add(vo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return galleryList;
	}
}
