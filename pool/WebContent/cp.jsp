<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	long begin1 = System.currentTimeMillis();
	Context initContext = new InitialContext();

	// 설정 정보를 가져와 DataSource를 가져와 Connection 객체를 생성
	// DataSourece는 getConnection객체를 통해 서버의 설정 정보를 한번만 불러오면 된다.
	DataSource ds = (DataSource) initContext.lookup("java:/comp/env/jdbc/myoracle");
	Connection con1 = ds.getConnection();
	System.out.println("획득된 커넥션 객체 : " + con1);
	con1.close();
	
	long end1 = System.currentTimeMillis();
	System.out.println("소요시간 : " + (end1 - begin1));
	
	long begin2 = System.currentTimeMillis();
	Connection con2 = ds.getConnection();
	long end2 = System.currentTimeMillis();
	System.out.println("소요 시간 : " + (end2-begin2));
	con2.close();
%>