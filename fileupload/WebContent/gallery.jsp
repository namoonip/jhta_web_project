<%@page import="vo.GalleryVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dao.GalleryDAO"%>
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
<div class="container">
	<h1>사진 갤러리</h1>
	
	<div class="row">
		<%
			GalleryDAO dao = new GalleryDAO();
			ArrayList<GalleryVO> galleryList = dao.getAllGallery();
			
			for (GalleryVO vo : galleryList) {
		%>
			<div class="col-sm-3">
				<div class="thumbnail">
					<img src="gallery/<%=vo.getFilename() %>" alt="photo" />
					<div class="caption">
						<p><strong><%=vo.getUsername() %></strong></p>
						<p><%=vo.getDescription() %></p>
					</div>
				</div>
			</div> 
				
		<%}%>
	</div>
</div>
</body>
</html>