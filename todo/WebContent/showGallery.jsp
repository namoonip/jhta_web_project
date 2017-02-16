<%@page import="vo.UserVO"%>
<%@page import="vo.GalVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GallDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
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
	<h1>사진 갤러리
	<label for=""><a href="uploadform.jsp" class="btn btn-primary">사진 등록</a></label></h1>
	<div class="row">
		<div class="col-md-3">
		<div class="thumbnail">
		<form action="deletfile.jsp" method="post">
		<%@ include file="common/logincheck.jsp" %>
		<%
			GallDAO dao = new GallDAO();
			ArrayList<GalVO> galList = dao.getAllUp(user.getId());
			
			if (galList.size() == 0) {
				%>
				<p style="font-size: 18px"><strong>등록된 사진이 없습니다.</strong>
				<label for=""><a href="uploadform.jsp" class="btn btn-info">첫 사진 등록</a></label>
				</p>
				<%
							
			}
			
			for (GalVO vo : galList) { %>
				<div class="caption">
					<div class="panel panel-success">
						<div class="panel-heading"><%=vo.getTitle() %>
						<button href="" class="btn btn-success btn-xs pull-right" ><span class="glyphicon glyphicon-star-empty"></span></button>
						</div>
					<div class="panel-body">
						<img src="gallery/<%=vo.getFilename()%>" style="max-width: 100%; height: auto;" alt="photo"/>
						<table class="table">
							<tr>
								<th>내용</th>
								<td><%=vo.getDescription() %></td>
							</tr>
							<tr>
								<th>장소</th>
								<td><%=vo.getLocation() %></td>
							</tr>
							<tr>
								<th>일시</th>
								<td><%=vo.getDay() %></td>
							</tr>
						</table>
					</div>
					<div class="panel-footer text-right">
						<a class="btn btn-danger" href="deletefile.jsp?fno=<%=vo.getNo() %>">삭제</a>
					</div>
					</div>
				</div>
				<%}%>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>