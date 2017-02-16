<%@page import="board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	BoardDAO dao = new BoardDAO();
	int no = Integer.parseInt(request.getParameter("no"));
	dao.delBoradByNum(no);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>삭제</title>
<script language=javascript>
	self.window.alert("입력한 글을 삭제하였습니다.");
	location.href="boardmain.jsp";
</script>
</head>
<body>
</body>
</html>