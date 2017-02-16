<%@page import="dao.TodoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	TodoDAO dao = new TodoDAO();
	dao.deleteTodoByNo(Integer.parseInt(request.getParameter("tno")));
	int pageNo = Integer.parseInt(request.getParameter("pno"));
	response.sendRedirect("list.jsp?pno="+pageNo);
%>