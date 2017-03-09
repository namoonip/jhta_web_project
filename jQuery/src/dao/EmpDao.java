package dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import util.SqlMapperUtil;
import vo.Dept;
import vo.Emp;

public class EmpDao {
	
	public List<Dept> getAllDept() throws SQLException{
		SqlMapClient sqlmap = SqlMapperUtil.getSqlMapper();
		return sqlmap.queryForList("getAllDepts");
	}
	
	public List<Emp> getEmps(int deptId) throws SQLException{
		SqlMapClient sqlmap = SqlMapperUtil.getSqlMapper();
		return sqlmap.queryForList("getEmps", deptId);
	}
	
	public Emp getEmp(int empId) throws SQLException{
		SqlMapClient sqlmap = SqlMapperUtil.getSqlMapper();
		return (Emp) sqlmap.queryForObject("getEmp", empId);
	}
}
