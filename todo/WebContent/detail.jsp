<%@page import="java.util.ArrayList"%>
<%@page import="vo.TodoVO"%>
<%@page import="dao.TodoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file ="common/logincheck.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>sample</title>
</head>
<body>
	<%@ include file="common/header.jsp" %>
<% 
	request.setCharacterEncoding("utf-8");
	int pageNo = Integer.parseInt(request.getParameter("pno"));
	TodoDAO dao = new TodoDAO();
	TodoVO todo = dao.getTodoVOByNo(Integer.parseInt(request.getParameter("tno")));
%>
	
	<div class="container">
		<div class="row">
			<div class="col-md-10 col-md-offset-1">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong>일정 상제정보</strong>
						<a href="delete.jsp?tno=<%=todo.getNo()%>&pno=<%=pageNo%>" class="btn btn-danger btn-sm pull-right">취소</a>
											<% if (todo.getCompleted().equals("Yes")) {
											%> 
												<button class="btn btn-success btn-sm pull-right" disabled>완료</button>
											<%	
											} else {
												
											%>
												<a href="complete.jsp?tno=<%=todo.getNo()%>&pno=<%=pageNo%>" class="btn btn-success btn-sm pull-right">완료</a>
											<%
											}
											%>
					</div>
					<div class="panel-body">
						<table class="table table-hover">
							<colgroup>
								<col width="30%" />
								<col width="*" />
							</colgroup>
							<tr>
								<th>종류</th>
								<td><%=todo.getCategory() %></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><%=todo.getTitle() %></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><%=todo.getDescription() %></td>
							</tr>
							<tr>
								<th>장소</th>
								<td><%=todo.getLocation() %></td>
							</tr>
							<tr>
								<th>일시</th>
								<td><%=todo.getDay() %></td>
							</tr>
							<tr>
								<th>처리 완료 여부</th>
								<td><%=todo.getCompleted() %></td>
							</tr>
						</table>
					</div>
					<div class="panel-footer text-right">
						<a href="list.jsp?pno=<%=pageNo%>" class="btn btn-default">목록보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>