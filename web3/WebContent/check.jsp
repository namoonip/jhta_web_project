<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	// 중복 여부를 검사할 아이디를 요청메세지에서 꺼내기
	String userId = request.getParameter("userid");
	System.out.println("중복여부를 검사할 아이디" + userId);	// dv카운터조회로 중복여부 찾아보기.
	
	// 중복여부를 검사하기
	String duplicated = "N";
	if("hong".equals(userId)) {
		duplicated = "Y";
	}
	
	// 중복여부를 Y/N으로 전달하기
	out.write(duplicated);
%>