<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" session="false"%>
<%
	request.setAttribute("address", "서울시 종로구 봉익동");

	String text = "";
	text += "<script>";
	text += "function hacking() {";
	text += " alert('괴도');";
	text += "}";
	text += "</script>";
	text += "<button onclick='hacking()'>실행</button>";
	
	request.setAttribute("memo", text);

	request.getRequestDispatcher("out_demo2.jsp").forward(request, response);
	
%>