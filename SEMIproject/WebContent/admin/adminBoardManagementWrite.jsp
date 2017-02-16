<%@page import="java.sql.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false" trimDirectiveWhitespaces="true" %>
 
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=News+Cycle:400,700" />
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="/css/style.css">

</head>

<!-- 모든유저가 보는 네비바 -->
<%@include file="/nav.jsp"%>

<!-- Admin의 네비바 -->
<%@include file="adminNav.jsp"%>

<body>

<!-- LogingCheck And Admin Check -->
<%
	if(session == null) {
	response.sendRedirect("/main.jsp?err");
	return;
	}
	request.setCharacterEncoding("utf-8");
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	
	if(!"admin".equals(user.getId())) {
		response.sendRedirect("/main.jsp?YourNotManager!");
		return;
	}
%>
	<div class="container" >
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-default">
					<div class="panel-heading" id="naviTarget">
						<h3>
						<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
						게시글 작성</h3>
					</div>
					<div class="panel-body">
						<form action="/AdminBoardManagementProcess" method="post" enctype="multipart/form-data" >
							<div class="form-group">
								<label>글 분류</label>
								<select class="form-control" id="type" name="type">
									  <option selected="selected" value="1">교환반품</option>
									  <option value="2" >배송전변경</option>
									  <option value="3" >상품문의</option>
									  <option value="4" >기타문의</option>
									  <option value="5" >공지사항</option>
									  <option value="6" >리뷰</option>
									  <option value="10" >F&amp;A</option>
								</select>
							</div>
							<div class="form-group">
								<label>제목</label>
								<input type="text" class="form-control" id="title" placeholder="제목을 입력해주세요" name="title">
							</div>
							<div class="form-group">
								<label>내용</label>
								<textarea class="form-control" rows="6" id="contents" placeholder="내용을 입력해주세요" name="contents" style="resize: none;" ></textarea>
							</div>
							<div class="form-group">
								<label>첨부파일</label>
								<input type="file" class="form-control" id="src001" name="src001">
							</div>
							<div class="form-group">
								<button type="submit" class="btn btn-success pull-right btn-lg"> 
								<span class="glyphicon glyphicon-ok" aria-hidden="true"></span></button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>