package app;

import java.io.Reader;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import vo.EmployeeVO;

public class Demo2 {

	public static void main(String[] args) throws Exception{
		
		Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlMapClient sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		
		EmployeeVO emp = new EmployeeVO();
		emp.setDepartmentId(60);
		emp.setSalary(5000);
		//emp.setJobId("SA_MAN");
		
		List<EmployeeVO> empList = sqlMapper.queryForList("searchEmployees", emp);
		System.out.println(empList);
		
	}
}
