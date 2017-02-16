<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String[] names = {"김무성", "김종인", "정의화", "유승민", "남경필", "김문수", "김진태"};
	request.setAttribute("names", names);

	request.getRequestDispatcher("foreach_demo4.jsp")
		.forward(request, response);
%>