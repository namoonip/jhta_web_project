package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;
import vo.BoardVO;

public class EditController implements Controller {
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		BoardDAO boardDao = new BoardDAO();
		BoardVO board = boardDao.getBoard(no);
		
		board.setTitle(request.getParameter("title"));
		board.setContents(request.getParameter("contents"));
		
		boardDao.updateBoard(board);
		
		return "redirect:detail.hta?no="+no;
	}
	
}
