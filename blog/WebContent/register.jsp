<%@page import="dao.BlogDAO"%>
<%@page import="vo.BlogVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");
	
	String type = request.getParameter("type");
	String title = request.getParameter("title");
	String writer = request.getParameter("writer");
	String contents = request.getParameter("contents");
	
	BlogVO blog = new BlogVO();
	blog.setTitle(title);
	blog.setWriter(writer);
	blog.setContents(contents);
	
	BlogDAO dao = new BlogDAO();
	
	if("new".equals(type)){
		
		int seq = dao.getSeq();
		blog.setNo(seq);
		blog.setGroupno(seq);		
		dao.addBlog(blog);
		
	}else if("re".equals(type)){
		//답글인 경우
		int seq = dao.getSeq();
		blog.setNo(seq);
		int groupno = Integer.parseInt(request.getParameter("gno"));
		blog.setGroupno(groupno);
		dao.addBlog(blog);
	}
	//새글인 경우
	
	response.sendRedirect("list.jsp");
%>