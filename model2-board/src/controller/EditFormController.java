package controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;
import vo.BoardVO;

public class EditFormController implements Controller{
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		BoardDAO boardDao = new BoardDAO();
		BoardVO board = boardDao.getBoard(Integer.parseInt(request.getParameter("no")));
		request.setAttribute("EditBoard", board);
		return "forward:editform.jsp";
	}
}
