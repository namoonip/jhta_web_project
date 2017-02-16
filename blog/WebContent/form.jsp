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
<title>Insert title here</title>
</head>
<body>
<%
	String type = request.getParameter("type");
	
%>
	<div class="container">
		<h1>새 글 등록폼</h1>
		<form action="register.jsp" method="post">
			<%
				if("new".equals(type)){		
			%>
				<input type="hidden" name="type" value="new"/>
			<%
				}else{	
			%>
				<input type="hidden" name="type" value="re" />
				<input type="hidden" name="gno" value="<%=request.getParameter("gno") %>" />
			<%		
				}
			%>
			<div class="form-group">
				<label>제목</label>
				<input type="text" class="form-control" name="title" />
			</div>
			<div class="form-group">
				<label>작성자</label>
				<input type="text" class="form-control" name="writer" />
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea name="contents" id="form-control"rows="5"></textarea>
			</div>
			<div class="form-group">
				<button type="submit" class="btn btn-success">등록</button>
			</div>
		</form>
	</div>

</body>
</html>