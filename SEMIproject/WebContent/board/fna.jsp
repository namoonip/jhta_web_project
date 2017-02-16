<%@page import="vo.BoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
	.tableTh1 {
		border: 1px solid;
		border-color: #dddddd;
		background-color: #fbf9fa;
		text-align: center;
	}
</style>
</head>
<body>
<%@include file="/nav.jsp"%>
<div class="container">
	<div style="padding-bottom: 60px; padding-top: 60px; text-align: center;">
		<h3>F&amp;A</h3> /
		<strong style="font-size: 13px; color: #757575;">이용안내 FAQ입니다.</strong>
			<br /><br />
	</div>
	<table class="table table-bordered" style="margin:auto; padding: 30px;">
		<colgroup>
				<col width="70px;"/>
				<col width="135px;" />
				<col width="auto;" />
				<col width="84px;" />
				<col width="100px;" />
				<col width="55px;" />
		</colgroup>
			<thead>
				<tr>
					<th scope="col" id="no">번호</th>
					<th scope="col" id="category">카테고리</th>
					<th scope="col" id="title">제목</th>
					<th scope="col" id="writer">작성자</th>
					<th scope="col" id="regdate">작성일</th>
				</tr>
			</thead>
			<tbody>
			<% 
				BoardDAO boardDAO = new BoardDAO();
				ArrayList<BoardVO> noticeBoardList = new ArrayList<>();
				
				noticeBoardList = boardDAO.getAllFA();
				
				for(BoardVO notice : noticeBoardList) {
			%>
				<tr>
					<td> <%=notice.getBoardNo() %> </td>
					<td> <%=notice.getBoardCategory() %> </td>
					<td> <a data-toggle="modal" data-target=".bs-example-modal-lg<%=notice.getBoardNo() %>"> <%=notice.getBoardTitle() %> </a> 
					
					<div class="modal fade bs-example-modal-lg<%=notice.getBoardNo() %>" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
					  <div class="modal-dialog modal-lg">
					    <div class="modal-content">
						    <div class="modal-header">
						     <button type="button" class="btn btn-danger pull-right" data-dismiss="modal">
						     <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
						     </button>
						     <h4 class="modal-title" id="myModalLabel">
						      <%=notice.getBoardTitle() %>
						     </h4>
						    </div>
					    	<div class="modal-body">
						      <%=notice.getBoardContents().replaceAll("\n", "<br/>") %>
						      
						      <% if(null != notice.getBoardFileName1()) { %>
						   		<img src="/itemImage/<%=notice.getBoardFileName1()%>" style="width: 100%" />
						      <% }  %>
						      
					    	</div>
					    </div>
					  </div>
					</div>
					</td>
					<td> <%=notice.getUserName() %> </td>
					<td> <%=notice.getSimpleDate() %> </td>
				</tr>
			<% } %>
			</tbody>
		</table>
	
</div>
<%@include file="/footer.jsp" %>
</body>
</html>