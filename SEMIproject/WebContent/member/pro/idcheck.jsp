<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true" %>
<%
	// 중복여부 할 아이디를 요청메세지에서 꺼내기
	String id = request.getParameter("id");
	String dupcheckResult = request.getParameter("dupcheckResult");
	
	MemberDAO dao = new MemberDAO();
	int count = dao.idCheck(id);
	
	// 중복여부 검사하기
	String duplicated = "Y";
	
	if (count == 0 ) {
		duplicated = "N";		
	} else if (count == 1) {
		duplicated = "Y";		
	}	
	
	// 중복여부를 전달
	out.write(duplicated);
%>