<%@page import="vo.BlogVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html >
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Insert title here</title>
<style type="text/css">
.reply{
	padding-left : 25px !important; 
	<!--!important 우선순위가 높아진다-->
}
</style>
</head>
<body>
	<div class="container">
		<h1>리스트</h1>
		
		<table class ="table table-condensed">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
				</tr>
			</thead>
			<tbody>
			<%
				BlogDAO dao = new BlogDAO();
				ArrayList<BlogVO> blogList = dao.getBlogList();
				for(BlogVO blog : blogList){
				%>
				<tr>
					<td><%=blog.getNo() %></td>
					<td class="<%=blog.getNo() != blog.getGroupno() ? "reply" : ""%>">
						<a href="detail.jsp?no=<%=blog.getNo() %>"><%=blog.getTitle() %></a>
						</td>
					<td><%=blog.getWriter() %></td>
					<td><%=blog.getRegdate() %></td>
				</tr>
			<%	
				}
			%>
			</tbody>
		</table>
			<!-- 어디에 진입하냐에따라 댓글이냐 새 글이냐 알아야하기때문에  -->
		<p class="text-right"><a href="form.jsp?type=new" class="btn btn-default">새 글</a></p>
	</div>
</body>
</html>