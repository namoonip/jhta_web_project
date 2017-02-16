<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<% request.setCharacterEncoding("utf-8"); %>
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
		<div class="panel panel-info">
			<form action="fileUpdateProcess.jsp?no=<%=request.getParameter("fileNo") %>" onsubmit="return nullCheck();">
			<div class="form-group">
				<label for="file-Name">
				File Name</label>
				<input type="text" name="fileName" id="file-Name" class="form-control" value="<%=request.getParameter("fileName")%>"/>
			</div>
			<div class="form-group">
				<label for="file-Drescription">
				File Description</label>
				<textarea name="fileDescription" id="file-Description" class="form-control" cols="50" rows="10"><%=request.getParameter("fileDescription")%></textarea>
			</div>
			<div class="form-group">
				<label for="file-Drescription">
				File Connected</label>
				<textarea name="fileConnected" id="file-Connected" class="form-control" cols="10" rows="5"><%=request.getParameter("fileConnected")%></textarea>
			</div>
			<input type="hidden" name="fileNo" value="<%=request.getParameter("fileNo") %>"/>
			<input type="hidden" name="fileMaker" value="<%=request.getParameter("fileMaker")%>"/>
			<input type="hidden" name="fileConnected" value="<%=request.getParameter("fileConnected")%>"/>
				<button type="submit" class="btn-primary">제출</button>
				<a href="fileList.jsp" class="btn-danger">취소</a>
			</form>
		</div>
	</div>
</body>
<script type="text/javascript">	
	function nullCheck() {
		var nameEL = document.getElementById("file-Name");
		var name = nameEL.value.trim();
		if(name=="") {
			alert("파일 이름을 입력하세요.");
			nameEL.focus();
			return false;
		}
		
		var fileDescriptionEL = document.getElementById("file-Description");
		var fileDescription = fileDescriptionEL.value.trim();
		if(fileDescription=="") {
			alert("설명을 입력하세요.");
			fileDescriptionEL.focus();
			return false;
		}
		return true;
	}
</script>
</html>