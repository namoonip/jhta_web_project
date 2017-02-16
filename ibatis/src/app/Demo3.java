package app;

import java.io.Reader;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import vo.EmployeeVO;

public class Demo3 {
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws Exception{
		
		Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlMapClient sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		
		List<EmployeeVO> empList1 = sqlMapper.queryForList("searchEmpBySalary", 1000);
		System.out.println(empList1);
		
		List<EmployeeVO> empList2 = sqlMapper.queryForList("searchEmpNameByDeptNum", 20);
		System.out.println(empList2);
		
		double allSalary = (double) sqlMapper.queryForObject("getAllSalaryByDeptNum", 80);
		System.out.println(allSalary);
		
		int deptEmpCountByJobId = (int) sqlMapper.queryForObject("getAllEmpByJobId", "SA_MAN");
		System.out.println(deptEmpCountByJobId);
		
		List<EmployeeVO> empList3 = (List<EmployeeVO>) sqlMapper.queryForList("searchEmpInfoById", 100);
		System.out.println(empList3);
		
		EmployeeVO emp = (EmployeeVO) sqlMapper.queryForObject("searchEmpInfoByFirstName", "Pat");
		System.out.println(emp);
		
	}
}
