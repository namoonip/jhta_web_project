<%@page import="util.NumberUtil"%>
<%@page import="vo.UserVO"%>
<%@page import="vo.TodoVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.TodoDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file ="common/logincheck.jsp" %>
<%
TodoDAO todoDao = new TodoDAO();
final int ROWS_PER_PAGE = 10;

// 내가 등록한 총 일정 갯수 조회
int totalRows = todoDao.getTotalRows(user.getId());

// 총 페이지 갯수 계산하기
int totalPages = (int) Math.ceil((double) totalRows / ROWS_PER_PAGE);

// 페이지 번호 알아내기 (방어 코드)
int pageNo = NumberUtil.StringToInt(request.getParameter("pno"), 1);

// 조회시 구간 시작값과 구간 끝값 알아내기
int beginIndex = (pageNo-1) * ROWS_PER_PAGE + 1;
int endIndex = pageNo * ROWS_PER_PAGE;

// 요청한 페이지에 해당하는 일정 조회하기
ArrayList<TodoVO> todoList = todoDao.getTodoListForPaging(beginIndex, endIndex, user.getId());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <title>Example</title>
</head>
<body>
<%@ include file="common/header.jsp" %>
	<div class="container">
		<div class="row">
			<div class="col-md-8 col-md-offset-3">
				<form action="registform.jsp" method="post">
					<div class="panel panel-info">
							<button class="btn btn-info pull-right">새 일정 등록</button>
						<div class="panel-heading">일정목록 <span class="badge"><%=totalRows %></span>
						</div>
						<div class="panel-body">
							<table class="table">
								<colgroup>
									<col width="*" />
									<col width="20%" />
									<col width="20%" />
									<col width="18%" />
								</colgroup>
								<thead>
									<tr>
										<th>제목</th>
										<th>날짜</th>
										<th>완료</th>
										<th></th>
									</tr>
								</thead>
								<tbody>
									 <%
										for (TodoVO todo : todoList) {
											
									%> 
										<tr>
											<td><a href="detail.jsp?tno=<%=todo.getNo()%>&pno=<%=pageNo%>"><%=todo.getTitle()%></a></td>
											<td><a href="detail.jsp?tno=<%=todo.getNo()%>&pno=<%=pageNo%>"><%=todo.getDay()%></a></td>
											<td><a href="detail.jsp?tno=<%=todo.getNo()%>&pno=<%=pageNo%>"><%=todo.getCompleted()%></a></td>
											<td>
												<% if (todo.getCompleted().equals("Yes")) {
												%> 
												<button class="btn btn-success btn-sm" disabled>완료</button>
												<%} else {%>
												<a href="complete.jsp?tno=<%=todo.getNo()%>&pno=<%=pageNo%>" class="btn btn-success btn-sm">완료</a>
												<%}%>
												<a href="delete.jsp?tno=<%=todo.getNo()%>&pno=<%=pageNo%>" class="btn btn-danger btn-sm">취소</a>
											</td>
										</tr>
									<%}
									%>
								</tbody>
							</table>
						</div>
							<div class="panel-footer text-center">
								<ul class="pagination">
									<% for (int index = 1; index <= totalPages; index++) { %> 
									
										<% if (index == pageNo) { %>
											<li class="active"><a href="list.jsp?pno=<%=index%>"><%=index%></a></li>
										<%} else {%>	
											<li><a href="list.jsp?pno=<%=index%>"><%=index%></a></li>						
										<%
											}
										%>									
									<% }%>
								</ul>
							</div>
						</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>