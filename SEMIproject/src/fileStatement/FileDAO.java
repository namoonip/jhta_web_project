package fileStatement;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import util.ConnectionUtil;

public class FileDAO {
	
	public void updateFileStatement(FileVO vo) throws SQLException {
		
		String sql = "update FILE_LIST set file_name=?, file_description=?, file_connected=?"
				+ " where file_no = ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo.getFileName());
		pstmt.setString(2, vo.getFileDescription());
		pstmt.setString(3, vo.getFileConnected());
		pstmt.setInt(4, vo.getFileNo());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
		
	}
	
	public void addFileList(FileVO vo) throws SQLException {
		
		String sql = "insert into file_list(file_no, file_name, file_description, file_maker, file_connected)"
				+ " values(file_seq.nextval, ?,?,?,?)";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, vo.getFileName());
		pstmt.setString(2, vo.getFileDescription());
		pstmt.setString(3, vo.getFileMaker());
		pstmt.setString(4, vo.getFileConnected());
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	
	public void deleteFileList(String filename) throws SQLException{
		
		String sql = "delete from file_list where file_name= ?";
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		pstmt.setString(1, filename);
		pstmt.executeUpdate();
		
		pstmt.close();
		con.close();
	}
	
	public ArrayList<FileVO> getAllFileList() throws SQLException{
		
		String sql = "select file_no, file_name, file_description, file_maker, file_connected "
				+ " from file_list";
		
		ArrayList<FileVO> fileList = new ArrayList<>();
		
		Connection con = ConnectionUtil.getConnection();
		PreparedStatement pstmt = con.prepareStatement(sql);
		ResultSet rs = pstmt.executeQuery();		
		
		while(rs.next()) {
			FileVO vo = new FileVO();
			vo.setFileNo(rs.getInt("file_no"));
			vo.setFileName(rs.getString("file_name"));
			vo.setFileDescription(rs.getString("file_description"));
			vo.setFileMaker(rs.getString("file_maker"));
			vo.setFileConnected(rs.getString("file_connected"));
			
			fileList.add(vo);
		}
		
		rs.close();
		pstmt.close();
		con.close();
		
		return fileList;
	}
}