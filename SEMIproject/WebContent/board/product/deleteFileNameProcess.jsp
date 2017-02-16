<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	String fileName = request.getParameter("fileNo");
	String boardNo = request.getParameter("bno");
	int bno = Integer.parseInt(boardNo);
	
	BoardDAO dao = new BoardDAO();
	dao.deleteFileName1InBoard(bno, fileName);
	dao.deleteFileName2InBoard(bno, fileName);
	dao.deleteFileName3InBoard(bno, fileName);
	dao.deleteFileName4InBoard(bno, fileName);
	dao.deleteFileName5InBoard(bno, fileName);
	
	out.write(fileName);	
%>