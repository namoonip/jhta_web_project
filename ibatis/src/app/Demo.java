package app;

import java.io.Reader;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.ibatis.common.resources.Resources;
import com.ibatis.sqlmap.client.SqlMapClient;
import com.ibatis.sqlmap.client.SqlMapClientBuilder;

import vo.UserVO;

public class Demo {
	
	@SuppressWarnings("unchecked")
	public static void main(String[] args) throws Exception{
		
		// 1. SqlMapConfig.xml 파일을 읽어오는 Reader 만들기
		Reader reader = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		
		// 2. SqlMapClient 인터페이스를 통해 객체 만들기
		// insert, delete, update, queryForObject할 때 사용되는 메소드가 정의되어 있다.
		SqlMapClient sqlMapper = SqlMapClientBuilder.buildSqlMapClient(reader);
		
		/*
		sqlMapper.delete("deleteAllUser");
		
		UserVO user = new UserVO();
		user.setId("hong111");
		user.setPwd("zxcv1234");
		user.setName("홍길동");
		user.setPhone("010-1234-5678");
		user.setAddr("서울시 종로구");
		user.setPoint(100);
		user.setRegdate(new Date());
		
		sqlMapper.insert("addNewUser", user);
		
		UserVO user2 = new UserVO();
		user2.setId("kin");
		user2.setPwd("1234addd");
		user2.setName("김유신");
		user2.setAddr("서울시 서대문구");
		user2.setPhone("010-1111-2222");
		user2.setPoint(200);
		user2.setRegdate(new Date());
		sqlMapper.insert("addNewUser", user2);		
		
		String name = (String) sqlMapper.queryForObject("getUsername", "hong111");
		System.out.println("조회된 결과 : " + name);
		
		
		List<String> userNames = (List<String>) sqlMapper.queryForList("getAllUsername");
		System.out.println(userNames);
		
		int userCount = (int) sqlMapper.queryForObject("getUserCount");
		System.out.println(userCount);
		*/
		
		UserVO user3 = (UserVO) sqlMapper.queryForObject("getUserById", "ho");
		System.out.println(user3.getName());	
		
		List<UserVO> userList = (List<UserVO>) sqlMapper.queryForList("getUsers");
		System.out.println(userList.get(0).getId());
		
		HashMap<String, Object> map1 = 
				(HashMap<String, Object>) sqlMapper.queryForObject("getUserByIdForMap", "kim");
		System.out.println(map1.get("NAME"));

	}
}
