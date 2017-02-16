package controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BookDAO;
import vo.Book;

@WebServlet(urlPatterns={"/book.hta"})
public class BookServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int no = Integer.parseInt(request.getParameter("no"));
		BookDAO dao = new BookDAO();
		Book book = dao.getBookByNo(no);
		request.setAttribute("book", book);
		
		request.getRequestDispatcher("WEB-INF/views/book.jsp").forward(request, response);
	}
}