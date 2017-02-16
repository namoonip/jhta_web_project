<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글 추가</title>
</head>
<body>
<h1>게시글 작성</h1>
	<form action="addboard.jsp">
		<table>
		<tr>
			<th>제목</th>
			<td colspan='2'><input type=text name="title"></td>
		</tr>
		<tr>
			<th>작성자</th>
			<td colspan='2'><input type=text name="writer" ></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan='2'><textarea name="contents" rows='3' cols='30'></textarea></td>
		</tr>
		<tr></tr>
		</table>
		<p>
		<button>등록</button>
		</p>
	</form>
	<input type="reset" value="CANCEL" onClick="history.back()"/>
		

</body>
</html>