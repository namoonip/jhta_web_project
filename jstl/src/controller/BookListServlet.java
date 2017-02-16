package controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import vo.Book;

@WebServlet(urlPatterns={"/books.hta"})
public class BookListServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 클라이언트의 요청 처리
		// 클라이언트가 전달한 값(쿼리스트링, 폼입력값)을 꺼내기
		// DAO를 활용해서 필요한 DB Access 작업진행
		// 클라이언트 요청이 데이터 조회인 경우 "뷰"역할을 수행하는 JSP에 조회된 데이터를 전달하기
		// <-- 요청 객체(HttpServletRequest)에 속성으로 전달한 데이터 저장하기
		// 요청을 이동시키기
		// 저장소에 대한 Insert/Update/Delete 요청 --> redirect 이동
		// 저장소에 대한 select 요청 --> forward 이동 		
		
		BookDAO dao = new BookDAO();
		ArrayList<Book> bookList = dao.getAllBooks();
		request.setAttribute("bookList", bookList);
		
		request.getRequestDispatcher("WEB-INF/views/books.jsp").forward(request, response);
	}
}
