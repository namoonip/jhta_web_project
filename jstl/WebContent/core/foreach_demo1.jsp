<%@page import="java.util.Date"%>
<%@page import="vo.Book"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%	
	String[] names = {"이순신", "홍길동", "김유신", "강감찬"};
	request.setAttribute("names", names);
	
	ArrayList<Book> bookList = new ArrayList<>();
	bookList.add(new Book(100, "자바의 정석", "남궁성", "도우 출판사", 35000, new Date()));
	bookList.add(new Book(120, "이것이 자바다", "신용권", "한빛 미디어", 25000, new Date()));
	bookList.add(new Book(130, "이것이 서블릿이다", "홍길동", "한빛 미디어", 30000, new Date()));
	request.setAttribute("bookList", bookList);
	
	request.getRequestDispatcher("foreach_demo2.jsp").forward(request, response);
%>