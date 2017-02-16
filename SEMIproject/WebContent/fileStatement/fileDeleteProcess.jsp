<%@page import="fileStatement.FileDAO"%>
<%@page import="fileStatement.FileVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	FileDAO dao = new FileDAO();
	dao.deleteFileList(request.getParameter("filename"));
	
	response.sendRedirect("fileList.jsp");
%>