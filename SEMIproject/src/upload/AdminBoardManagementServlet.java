package upload;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.AdminOnlyDAO;
import vo.BoardVO;

@MultipartConfig
@WebServlet(urlPatterns={"/AdminBoardManagementProcess"})
public class AdminBoardManagementServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		int type = Integer.parseInt(req.getParameter("type"));
		String title = req.getParameter("title");
		String contents = req.getParameter("contents");
		String category	= "";
		
		if(type == 1) {
			category = "교환반품";
		} else if (type == 2) {
			category = "배송전변경";
		} else if (type == 3) {
			category = "상품문의";
		} else if (type == 4) {
			category = "기타문의";
		} else if (type == 5) {
			category = "공지사항";
		} else if (type == 6) {
			category = "리뷰";
		} else if (type == 7) {
			category = "인재";
		} else if (type == 8) {
			category = "이벤트";
		} else if (type == 9) {
			category = "only you";
		} else if (type == 10) {
			category = "F&A";
		}
		
		Part src001 = req.getPart("src001");
		
		String src001Filename = getImageName(src001);
		
		// 테스트용
		String itemDir = "C:\\web_project\\workspace\\SEMIproject\\WebContent\\itemImage";
		
/*		// 리얼패스
		ServletContext application = this.getServletContext();
        String itemDir = application.getRealPath("itemImage");
*/
		
		if(src001Filename != null && !src001Filename.isEmpty()){
			src001Filename = System.currentTimeMillis() + src001Filename;
			src001.write(itemDir + "/" + src001Filename);
		}
		
		BoardVO board = new BoardVO();
		
		board.setBoardTitle(title);
		board.setBoardType(type);
		board.setBoardContents(contents);
		board.setBoardCategory(category);
		board.setBoardUserNo(0);
		board.setUserName("Admin");
		board.setBoardFileName1(src001Filename);
		
		AdminOnlyDAO adminDAO = new AdminOnlyDAO();
		try {
			adminDAO.addBoard(board);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		res.sendRedirect("/admin/adminBoardManagement.jsp");
	}
	
		private String getImageName(Part part){
			String headerValue = part.getHeader("content-disposition");
			String[] elements = headerValue.split(";");
			for(String el : elements){
				if(el.trim().startsWith("filename")){
					return el.substring(el.indexOf("=") + 1).replace("\"", "");
				}
			}
			return null;
	}
}
