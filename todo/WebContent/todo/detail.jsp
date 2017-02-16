    pageEncoding="UTF-8" session="false"%>
<%@page import="vo.TodoVO"%>
<%@page import="dao.TodoDAO"%>
<%@ include file="loginCheck.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="../bootstrap-3.3.2/css/bootstrap.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>To Do Detail</title>
</head>
<body>
<div class="navbar">
	<div class="container-fluid well">
		<div class="navbar-header"><a href="index.jsp">Todo App</a></div>
	</div>
</div>
<div class="container">
	<div class="row">
		<div class="col-md-4 col-md-offset-4">
			<form method="post" action="index.jsp">
				<div class="panel panel-info">
					<div class="panel-heading">일정 상세정보</div>
					<div class="panel-body">
						<table>
							<%
								TodoDAO dao = new TodoDAO();
								TodoVO vo = dao.getTodoVOByNo(Integer.parseInt(request.getParameter("no")));								
							%> 
							<colgroup>
								<col width="30%" />
								<col width="70%" />
							</colgroup>
							<thead>
								<tr>
									<th>종류</th>
									<th><%= vo.getCategory() %></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>제목</td>
									<td><%= vo.getTitle() %></td>
								</tr>
								<tr>
									<td>내용</td>
									<td><%= vo.getDescription() %></td>
								</tr>
								<tr>
									<td>일시</td>
									<td><%= vo.getDay() %></td>
								</tr>
								<tr>
									<td>장소</td>
									<td><%= vo.getLocation() %></td>
								</tr>
								<tr>
									<td>처리완료여부</td>
									<td><%= vo.getCompleted() %></td>
								</tr>
							</tbody>							
						</table>
					</div>
					<div class="panel-footer text-right">
						<a class="btn btn-default" href="index.jsp">목록보기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
</body>
</html>