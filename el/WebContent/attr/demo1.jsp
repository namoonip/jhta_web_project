<%@page import="java.util.HashMap"%>
<%@page import="vo.Artist"%>
<%@page import="vo.Song"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="false"%>
<%
	// 요청객체에 담기
	request.setAttribute("team", "twice");
	request.setAttribute("members", new String[]{"사나", "모모", "정연", "미나", "다현", "쯔위"});
	
	ArrayList<String> albums = new ArrayList<>();
	albums.add("첫 페이지");
	albums.add("두번째 페이지");
	albums.add("레인1");
	albums.add("레인2");
	request.setAttribute("albums", albums);

	Artist artist = new Artist("트와이스", "JYP 엔터테이먼트", 22);
	
	Song firstSong = new Song();
	firstSong.setTitle("OOH-AHH하게");
	firstSong.setArtist(artist);
	firstSong.setRunningTime(620);
	firstSong.setCompany("JYP");
	request.setAttribute("song", firstSong);
	
	HashMap<String, Object> movie = new HashMap<>();
	movie.put("title", "조작된 도시");
	movie.put("actor", "지창욱, 심은경, 오정세");
	movie.put("director", "박광현");
	movie.put("genre", "범죄/액션");
	movie.put("running-time", "126분");
	request.setAttribute("movie", movie);

	// demo2.jsp로 이동시키기 - forword
	request.getRequestDispatcher("demo2.jsp").forward(request, response);
%>