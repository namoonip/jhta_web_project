<%@page import="vo.UserVO"%>
<%@page import="dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
request.setCharacterEncoding("utf-8");

HttpSession session = request.getSession(false);
UserVO user = (UserVO)session.getAttribute("LOGINED_USER");

String id = request.getParameter(user.getId());

String begin = request.getParameter("startDate");
String end = request.getParameter("endDate");

MemberDAO dao = new MemberDAO();

response.sendRedirect("/mypage/view/mypageForm.jsp");
%>