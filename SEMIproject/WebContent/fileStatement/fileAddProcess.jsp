<%@page import="fileStatement.FileDAO"%>
<%@page import="fileStatement.FileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setCharacterEncoding("utf-8");

	FileDAO dao = new FileDAO();
%> 
<jsp:useBean id="fileVO" class="fileStatement.FileVO"/>
<jsp:setProperty property="*" name="fileVO"/>	
<%
	dao.addFileList(fileVO);
	response.sendRedirect("fileList.jsp");
%>
