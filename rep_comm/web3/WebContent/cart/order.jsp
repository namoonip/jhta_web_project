<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%

	String[] productNoList = request.getParameterValues("pno");
	String[] qtyList = request.getParameterValues("qty");
	
	for (String p : productNoList) {
		System.out.println(p);
	}
	
	for (String q : qtyList) {
		System.out.println(q);
	}
	
%>






