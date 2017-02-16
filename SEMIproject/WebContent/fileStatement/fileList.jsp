<%@page import="fileStatement.FileVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="fileStatement.FileDAO"%>
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
<title>File List</title>
</head>
<body>
	<div class="container">
	<form action="fileModifyForm.jsp" method="post">
		<table class="table">
		<colgroup>
			<col width="20%" />
			<col width="*" />
			<col width="15%" />
			<col width="30%" />
		</colgroup>
		<thead>
			<tr>
				<th>File Name</th>
				<th>File Description</th>
				<th>File Maker</th>
				<th>File Connected</th>
			</tr>
			<tr>
			</thead>
			<tbody>
			<% FileDAO dao = new FileDAO();
			   ArrayList<FileVO> fileList = dao.getAllFileList();
			   for (FileVO vo : fileList) { %>
				<tr>
					<td><input type="hidden" name="fileName" value="<%=vo.getFileName()%>"/><%=vo.getFileName() %></td>
					<td><input type="hidden" name="fileDescription" value="<%=vo.getFileDescription()%>"/><%=vo.getFileDescription().replace("\n","<br/>") %></td>
					<td><input type="hidden" name="fileMaker" value="<%=vo.getFileMaker()%>"/><%=vo.getFileMaker() %></td>
					<td>
						<input type="hidden" name="fileConnected" value="<%=vo.getFileConnected()%>"/><%=vo.getFileConnected().replace("\n","<br/>") %>
						<input type="hidden" name="fileNo" value="<%=vo.getFileNo() %>"/>
						<button type="submit" class="btn-info btn-sm">Modify</button>
						<a href="fileDeleteProcess.jsp?filename=<%=vo.getFileName()%>" class="btn btn-danger btn-sm">Delete</a>
					</td>		
				</tr>
				<%}%>
			</tbody>
		</table>
		</form>
		<div class="panel">
			<form method="post" class="form-group" onsubmit="return nullCheck();" action="fileAddProcess.jsp">
				<table>
					<thead>
						<tr>
							<th><label for="file-Maker"> File Maker : </label>
								<select name="fileMaker" id="file-Maker">
								<option value="송수민">송수민</option>
								<option value="장해영">장해영</option>
								<option value="최준휘">최준휘</option>
								<option value="황진수">황진수</option>
								<option value="윤현근">윤현근</option>
								</select>
							</th>
							<th><label for="file-Name">	File Name : </label>
								<input type="text" name="fileName" id="file-Name" value=".jsp"/>
							</th>		
							<th><label for="file-Connected"> File Connected : </label>
							<textarea name="fileConnected" id="file-Connected" cols="10" rows="5"></textarea>
							</th>
							
							<th><label for="file-Description">	File Description : </label>
								<textarea name="fileDescription" id="file-Description" cols="50" rows="10"></textarea>
							</th>
						</tr>
					</thead>
				</table>
				<button type="submit" class="pull-right">추가</button>
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