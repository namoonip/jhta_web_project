package controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.BoardDAO;
import model2.Controller;
import vo.BoardVO;

public class ListController implements Controller{
		
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		BoardDAO boardDao = new BoardDAO();
		List<BoardVO> boardList = boardDao.getAllBoard();
		request.setAttribute("boards", boardList);		
		
		return "forward:list.jsp";
	}
}
