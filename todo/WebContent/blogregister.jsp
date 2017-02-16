<%@page import="dao.BlogDAO"%>
<%@page import="vo.BlogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%@ include file="common/logincheck.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	String type = request.getParameter("type");
	
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	int pwd = Integer.parseInt(request.getParameter("pwd"));
	
	BlogVO blog = new BlogVO();
	blog.setTitle(title);
	blog.setWriter(writer);
	blog.setContents(contents);
	blog.setPwd(pwd);
	blog.setUserId(user.getId());
	
	BlogDAO dao = new BlogDAO();
	
	if ("new".equals(type)) {
		
		int seq = dao.getSeq();
		blog.setNo(seq);
		blog.setGroupno(seq);
		dao.addBlog(blog);
		
	} else if ("re".equals(type)) {
		
		int seq = dao.getSeq();
		blog.setNo(seq);
		int groupno = Integer.parseInt(request.getParameter("gno"));
		blog.setGroupno(groupno);
		dao.addBlog(blog);
	}
	
	response.sendRedirect("bloglist.jsp");
	
%>