<%@page import="vo.BlogVO"%>
<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%


%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<h1>글 상세보기</h1>
		<table class="table">
<%
	int no = Integer.parseInt(request.getParameter("no"));
	BlogDAO blogDao = new BlogDAO();
	BlogVO blog = blogDao.getBlogByNo(no);
%>
			<tbody>
				<tr>
					<th>제목</th>
					<td><%=blog.getTitle() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=blog.getWriter() %></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><%=blog.getRegdate() %></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%=blog.getContents().replace("\n", "<br/>") %></td>
				</tr>
			</tbody>		
		</table>
		<p class="text-right">
			<a href="form.jsp?type=re&gno=<%=blog.getNo() %>" class="btn btn-default">댓글</a>
			<a href="list.jsp" class="btn btn-primary">목록</a>
		</p>
	</div>

</body>
</html>