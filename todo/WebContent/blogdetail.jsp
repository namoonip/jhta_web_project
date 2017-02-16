<%@page import="vo.ReviewVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="vo.BlogVO"%>
<%@page import="dao.BlogDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="common/logincheck.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>글</title>
</head>
<body>
<%@ include file="common/header.jsp" %>
<%
	int no = Integer.parseInt(request.getParameter("no"));
	String pwd = request.getParameter("pwd");
	BlogDAO blogDAO = new BlogDAO();
	BlogVO blog = blogDAO.getBlogByNo(no, Integer.parseInt(pwd));
%>
<div class="container">
	<div class="row">
		<div class="col-md-6 col-md-offset-3">
			<div class="panel panel-info">
				<form action="reviewprocess.jsp?&bno=<%=blog.getNo()%>&pwd=<%=pwd %>" method="post" onsubmit="return contentsCheck()">
					<div class="panel panel-heading pull-left">
						<strong>Board Detail</strong>
						<small class="text-right"><%=blog.getReadcount() %></small>
					</div>
					<div class="panel-body">
					<table class="table">
						<tbody>
							<tr>
								<th>제목</th>
								<td><%=blog.getTitle() %></td>
							</tr>
							<tr>
								<th>작성자</th>
								<td><%=blog.getWriter() %></td>
							</tr>
							<tr>
								<th>등록일</th>
								<td><%=blog.getSimpleDate() %></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><%=blog.getContents().replace("\n", "<br/>") %></td>
							</tr>
							</tbody>
							</table>
							<table>
							<colgroup>
								<col width="8%" />
								<col width="15%" />
								<col width="40%" />
								<col width="25%" />
							</colgroup>
							<thead>
								<tr>
									<th>No</th>
									<th>ID</th>
									<th>내용</th>
									<th>작성일</th>
								</tr>
							</thead>
							<tbody>
							<%
								ArrayList<ReviewVO> reviewList = blogDAO.getAllReviw(blog.getNo());
								
								for (ReviewVO review : reviewList) {
							%>
								<tr>
									<td><%=review.getNo() %></td>
									<td><%=review.getUserId() %></td>
									<td><% if (review.getContents()!=null) {
											int cyecleNo = (int) (review.getContents().length() / 35);
											ArrayList<String> arr = new ArrayList<String>();
											int count = 0;
											String reviewContents = "";
											if(review.getContents().contains("\n")) {
												reviewContents = review.getContents().replace("\n", "<br/>");
												for (int i=0; i<cyecleNo; i++) {
													String reviewContents1 = reviewContents.substring(34*i, 34*(i+1));
													String reviewContents2 = "";
													count++;
													reviewContents2 = reviewContents1 + "<br/>";														
													arr.add(reviewContents2);
												}
											} else {
												for (int i=0; i<cyecleNo; i++) {
													String reviewContents1 = review.getContents().substring(34*i, 34*(i+1));
													String reviewContents2 = "";
													count++;
													reviewContents2 = reviewContents1 + "<br/>";														
													arr.add(reviewContents2);
												}
												arr.add(review.getContents().substring(count*34, review.getContents().length()));
												
											}
											for (String contents : arr) { %>
											<%=contents%> <%
											}
										}
										%>
										</td>
									<td><%=review.getSimpleDate() %>
								<%
									if(user.getId().equals(review.getUserId())) {										
								%>
									<a href="blogdetailDeleteprocess.jsp?no=<%=blog.getNo() %>&rno=<%=review.getNo()%>&pwd=<%=pwd %>" class="btn btn-danger btn-sm">
										<small>삭제</small>
									</a>
								<%}%>
									</td>
								</tr>								
							<%}%>
							</tbody>
					</table>
						<div class="pull-right">
						<a href="bloglist.jsp" class="btn btn-primary"><small class="pull-right">목록</small></a>
						</div>
					</div>
					<div class="panel-footer">
						<div class="row">
							<div class="col-md-1">
								<input type="text" value="<%=blog.getUserId()%>" size="10" disabled/>
							</div>
							<div class="col-md-7">
								<textarea name="contents" cols="45" rows="4" id="contents"></textarea>
							</div>
							<div class="col md-4 pull-right">
							<button type="submit" class="btn btn-info btn-sm">댓글</button>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</body>
<script type="text/javascript">
 function contentsCheck(){
	 var contentsEL = document.getElementById("contents");
	 var contens = contentsEL.value.trim();
	 if (contens=="") {
		alert("내용을 입력하세요.");
		return false;
	 }
	 return true;
 }
</script>
</html>