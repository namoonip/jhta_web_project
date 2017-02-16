<%@page import="org.apache.catalina.User"%>
<%@page import="vo.BlogVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="common/logincheck.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
<title>Bulletin Board</title>
<style type="text/css">
.reply {
	padding-left : 25px !important;
}
</style>
</head>
<body>
	<%@ include file="common/header.jsp"%>
	<%
	BlogDAO blogDAO = new BlogDAO();
	ArrayList<BlogVO> blogList = blogDAO.getAllBlogList();
%>
	<div class="container">
		<div class="row">
			<div class="col-md-10">
				<form action="blogform.jsp?type=new" method="post">
					<div class="panel panel-info">
						<div class="panel-heading" style="font-size: 30px;">
							<strong>Bulletin Board</strong>
						</div>
						<div class="panel-body">
							<table class="table talbe-condensed">
								<thead>
									<tr>
										<th>번호</th>
										<th>제목</th>
										<th>작성자(ID)</th>
										<th>등록일</th>
										<th>조회수</th>
									</tr>
								</thead>
								<tbody>
									<%
										for (BlogVO blog : blogList) {
									%>
									<tr>
										<td><a href="blogPwdCheckForm.jsp?no=<%=blog.getNo()%>"><%=blog.getNo()%></a>
										</td>
										<td	class="<%=blog.getNo() != blog.getGroupno() ? "reply" : ""%>">
											<a href="blogPwdCheckForm.jsp?no=<%=blog.getNo()%>"> <%
											 	if (blog.getNo() != blog.getGroupno()) {
											 %><i class="material-icons">&#xE5DA;</i> [re]<%
											 	}
											 %> <%
											 	int reviewCount = blogDAO.getReviewCountByNo(blog.getNo());
											 %>	<%=blog.getTitle()%> <%
											 	if (reviewCount != 0) {
											 %> (<%=reviewCount%>)
											 <% } %>
										</a>
										</td>
										<td><a href="blogPwdCheckForm.jsp?no=<%=blog.getNo()%>"><%=blog.getWriter()%>(<%=blog.getUserId()%>)</a></td>
										<td><%=blog.getSimpleDate()%></td>
										<th><%=blog.getReadcount() %></th>
										<th><a href="blogform.jsp?type=re&gno=<%=blog.getNo()%>"
											class="btn btn-info"><span
												class="glyphicon glyphicon-plus" aria-hidden="true"></span>아랫글</a>
											<%
												if (user.getId() != null) {
														if (user.getId().equals(blog.getUserId())) {
											%> <a
											href="blogdelete.jsp?no=<%=blog.getNo()%>&check=<%=blog.getUserId()%>"
											class="btn btn-danger">삭제</a> <%
									 	}
									 		}
									 %></th>
									</tr>
									<%}%>
								</tbody>
							</table>
						</div>
						<div class="panel-footer text-right">
							<button class="btn btn-success">글 작성</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
</script>
</html>