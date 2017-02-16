<%@page import="demo1.UserVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	ArrayList<UserVO> userList = new ArrayList<>();
	
	UserVO user1 = new UserVO();
	user1.setName("홍길동");
	user1.setPhone("010-1111-1111");
	
	UserVO user2 = new UserVO();
	user2.setName("김유신");
	user2.setPhone("010-2222-2222");
	
	userList.add(user1);
	userList.add(user2);

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>사용자 리스트</h1>
	
	<%
		for (UserVO user : userList) {
	%>
		<p><%=user.getName()%> <%=user.getPhone()%></p>
	
	<%
		}
	%>	
</body>
</html>