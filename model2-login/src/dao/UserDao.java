package dao;

import java.sql.SQLException;
import java.util.List;

import util.SqlMapperUtil;
import vo.UserVO;

public class UserDao {
	
	public void changUserStateN(String userId) throws SQLException {
		SqlMapperUtil.getSqlMapper().update("changeUserStateN", userId);
	}
	
	public void changUserStateY(String userId) throws SQLException {
		SqlMapperUtil.getSqlMapper().update("changeUserStateY", userId);
	}
	
	public UserVO getUserById(String userid) throws SQLException {
		return (UserVO) SqlMapperUtil.getSqlMapper().queryForObject("getUserById", userid);		
	}

	public void addNewUser(UserVO user) throws SQLException {
		SqlMapperUtil.getSqlMapper().insert("addNewUser", user);
	}
	
	@SuppressWarnings("unchecked")
	public List<UserVO> getAllUsers() throws SQLException{
		return SqlMapperUtil.getSqlMapper().queryForList("getAllUsers");
	}
	
}
