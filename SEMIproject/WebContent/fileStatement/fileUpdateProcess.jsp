<%@page import="fileStatement.FileVO"%>
<%@page import="fileStatement.FileDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% 
	request.setCharacterEncoding("utf-8");
	FileDAO dao = new FileDAO();
	FileVO vo = new FileVO();
	vo.setFileNo(Integer.parseInt(request.getParameter("fileNo")));
	vo.setFileName(request.getParameter("fileName"));
	vo.setFileConnected(request.getParameter("fileConnected"));
	vo.setFileMaker(request.getParameter("fileMaker"));
	vo.setFileDescription(request.getParameter("fileDescription"));
	dao.updateFileStatement(vo);
	
	response.sendRedirect("fileList.jsp");
%>