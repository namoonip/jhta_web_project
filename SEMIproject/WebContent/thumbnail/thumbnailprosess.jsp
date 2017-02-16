<%@page import="dao.ItemDetailDAO"%>
<%@page import="vo.ItemVO"%>
<%@page import="dao.MemberDAO"%>
<%@page import="vo.UserVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	HttpSession session = request.getSession(false);
	
	if(session == null){
		response.sendRedirect("/member/view/loginForm.jsp");
		return;
	}
	
	UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
	
	if(user == null){
		response.sendRedirect("/member/view/loginForm.jsp");
		return;
	}
%>
<%
	String gubun = request.getParameter("gubun");
	
	if("buy".equals(gubun)){
		
		String itemColor = request.getParameter("itemColor");
		String[] arr = itemColor.split("-");
		int itemNo = Integer.parseInt(arr[0]);
		String color = arr[1];
		String size = request.getParameter("itemSize");
		String count = request.getParameter("itemCount");
		
		ItemDetailDAO dao = new ItemDetailDAO();
		int userNo = user.getNo();
		
		dao.setItemInformation(userNo, itemNo, count, color, size);
		response.sendRedirect("/cart.jsp");
		
	}else if("cart".equals(gubun)){
		String itemColor = request.getParameter("itemColor");
		String[] arr = itemColor.split("-");
		int itemNo = Integer.parseInt(arr[0]);
		String itemno = String.valueOf(itemNo);
		String color = arr[1];
		String pNo = arr[2];
		String groupNo = arr[3];
		String size = request.getParameter("itemSize");
		String count = request.getParameter("itemCount");
		
		ItemDetailDAO dao = new ItemDetailDAO();
		int userNo = user.getNo();
		
		dao.setItemInformation(userNo, itemNo, count, color, size);
		
		response.sendRedirect("/thumbnail/thumbdetail.jsp?ino="+itemno+"&pno="+pNo+"&groupno="+groupNo+"");
		%>
<%
	}
%>