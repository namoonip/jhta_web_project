<%@page import="java.util.ArrayList"%>
<%@ page import="demo1.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("utf-8");

	ArrayList<UserVO> list = new ArrayList<>();

	String name = request.getParameter("username");
	String phone = request.getParameter("userphone");
	
	UserVO user1 = new UserVO();
	user1.setName(name);
	user1.setPhone(phone);
	
	// db에 저장했다... 가정
	response.sendRedirect("list.jsp");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
</body>
</html>