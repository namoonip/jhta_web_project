package dao;

import java.sql.SQLException;
import java.util.List;

import util.SqlMapperUtil;
import vo.BoardVO;

public class BoardDAO {
	
	public void updateBoard(BoardVO board) throws SQLException {
		SqlMapperUtil.getSqlMapper().update("updateBoardByNo", board);
	}
	
	public BoardVO getBoard(int no) throws SQLException {
		return (BoardVO) SqlMapperUtil.getSqlMapper().queryForObject("getBoardByNo", no);
	}
	
	public void deleteBoard(int no) throws SQLException{
		SqlMapperUtil.getSqlMapper().delete("deleteBoard", no);
		
	}
	
	public void addBoard(BoardVO board) throws SQLException {
		SqlMapperUtil.getSqlMapper().insert("addBoard", board);		
	}
	
	@SuppressWarnings("unchecked")
	public List<BoardVO> getAllBoard() throws SQLException{
		return SqlMapperUtil.getSqlMapper().queryForList("getAllBoard");		
	}
	
}