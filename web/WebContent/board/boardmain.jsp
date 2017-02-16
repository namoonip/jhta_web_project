<%@page import="java.sql.Date"%>
<%@page import="board.BoardDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.BoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
</head>
<body>
	<h1>자유 게시판</h1>
	<table width="50%" border="1" >
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>굿이요</th>
			<th colspan='2'>작성일</th>
		</tr>
	<%
		BoardDAO dao = new BoardDAO();
		ArrayList<BoardVO> boardList = dao.getAllBoard();
		for(BoardVO board : boardList) { 
		 	int no = board.getNo();
			String title = board.getTitle();
			String writer = board.getWriter();
			int likes = board.getLikes();
			Date regdate = board.getRegDate();
			%> 
			<tr>
				<td><%=no %></td>
				<td onclick="myFunction()"><a href="detail.jsp?no="<% %>></a><%=title %></td>
				<td><%=writer %></td>
				<td><%=likes %></td>
				<td><%=regdate %></td>
				<td><a href="delete.jsp?no=<%=no %>">삭제</a></td>
			</tr>
		<%
		}
		%></table> 
		<form action="addform.jsp">
		<button>작성 하기</button>
		</form><%
	%>
</body>
</html>