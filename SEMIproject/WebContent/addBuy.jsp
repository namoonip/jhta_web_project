<%@page import="dao.AddBuyDAO"%>
<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	request.setCharacterEncoding("utf-8");

	String id = request.getParameter("userId");
	String[] itemNo = request.getParameterValues("itemNo");
	String[] count = request.getParameterValues("count");
	
	int usePoint = Integer.parseInt(request.getParameter("usepoint"));
	String size = request.getParameter("size");
	String color = request.getParameter("color");
	double disCount = Double.parseDouble(request.getParameter("disCount"));
	
	String[] productCounts = request.getParameterValues("productCounts");
	
	for (int i=0; i<itemNo.length; i++) {
		
		int no = Integer.parseInt(itemNo[i]);
		int itemCount = Integer.parseInt(count[i]);
		int productCount = Integer.parseInt(productCounts[i]);
		
	}
	
	
	AddBuyDAO dao = new AddBuyDAO();
	int orderNo = dao.orderNo();
	
	dao.addBuyMall(id, disCount, orderNo);
	dao.addUsePoint(usePoint,orderNo);
	
	for (int i=0; i<itemNo.length; i++) {
		
		int no = Integer.parseInt(itemNo[i]);
		int itemCount = Integer.parseInt(count[i]);
		int productCount = Integer.parseInt(productCounts[i]);
		
		dao.addBuyItem(no, itemCount, orderNo, size, color);
		dao.updateProductCount(no, productCount-itemCount);
		dao.deleteCart(no);
		
	}
	
	response.sendRedirect("/main.jsp");
	
	

%>