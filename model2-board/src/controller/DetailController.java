package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;
import vo.BoardVO;

public class DetailController implements Controller{
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDAO boardDao = new BoardDAO();
		BoardVO board = (BoardVO) boardDao.getBoard(no);
		request.setAttribute("board", board);
		
		return "forward:detail.jsp";
	}
}