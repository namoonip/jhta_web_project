package upload;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import dao.BoardDAO;
import util.MD5;
import util.NumberUtil;
import vo.BoardVO;
import vo.UserVO;

@MultipartConfig
@WebServlet(urlPatterns="/board/upload.do")
public class BoardUploadServlet extends HttpServlet {
	
    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
		HttpSession session = request.getSession(false);
		UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
		request.setCharacterEncoding("utf-8");
		
		BoardDAO dao = new BoardDAO();
		BoardVO vo = new BoardVO();
		int tno = 1;
		if (request.getParameter("boardType").equals("1")) {
			vo.setBoardCategory("교환/반품 문의");
			tno = 1;
		} else if (request.getParameter("boardType").equals("2")) {
			vo.setBoardCategory("배송전 요청문의");
			tno = 2;
		} else if (request.getParameter("boardType").equals("3")) {
			vo.setBoardCategory("상품 문의");
			tno = 3;
		} else if (request.getParameter("boardType").equals("4")) {
			tno = 4;
			vo.setBoardCategory("기타 문의");
		} else if (request.getParameter("boardType").equals("6")) {
			tno = 6;
			vo.setBoardCategory("구매 후기");
		}
		vo.setBoardType(tno);
		
		vo.setBoardTitle(request.getParameter("boardTitle"));
		vo.setBoardContents(request.getParameter("boardContents"));
		vo.setUccURL(request.getParameter("uccUrl"));
		
		if (request.getParameter("boardPwd")==null) {
			vo.setBoardPwd("0");
		} else {
			String pwd = request.getParameter("boardPwd");
			String secuPwd = "0";
			try {
				secuPwd = MD5.hash(pwd);
			} catch (Exception e) {
				e.printStackTrace();
			}
			vo.setBoardPwd(secuPwd);
		}
		vo.setSecret(request.getParameter("secret"));
		vo.setUserName(user.getName());
		vo.setBoardUserNo(user.getNo());
		if(request.getParameter("rating-input-1") != null) {
			vo.setBoardSatis(Double.parseDouble(request.getParameter("rating-input-1")));
		}
		
		String iNo = request.getParameter("ino");
		int ino = NumberUtil.StringToInt(iNo, 1);
		if(iNo == null) {
			vo.setBoardItemNo(2302);
		} else {
			ino = Integer.parseInt(iNo);
			vo.setBoardItemNo(ino);			
		}
		
		String uploadDir = "C:\\web_project\\workspace\\SEMIproject\\WebContent\\itemImage\\upload";		

		Part part1 = request.getPart("boardFileName1");
		String filename1 = getFilename(part1);
		
		if(filename1!=null && !filename1.isEmpty()) {
			filename1 = System.currentTimeMillis()+filename1;
			part1.write(uploadDir + "/" + filename1);
			vo.setBoardFileName1(filename1);
		}			

		Part part2 = request.getPart("boardFileName2");
		String filename2 = getFilename(part2);
		
		if(filename2!=null && !filename2.isEmpty()) {
			filename2 = System.currentTimeMillis()+filename2;
			part2.write(uploadDir + "/" + filename2);
			vo.setBoardFileName2(filename2);			
		}
			
		Part part3 = request.getPart("boardFileName3");
		String filename3 = getFilename(part3);
		
		if(filename3!=null && !filename3.isEmpty()) {
			filename3 = System.currentTimeMillis()+filename3;
			part3.write(uploadDir + "/" + filename3);
			vo.setBoardFileName3(filename3);	
		}			
		
		Part part4 = request.getPart("boardFileName4");
		String filename4 = getFilename(part4);

		if(filename4!=null && !filename4.isEmpty()) {
			filename4 = System.currentTimeMillis()+filename4;
			part4.write(uploadDir + "/" + filename4);
			vo.setBoardFileName4(filename4);	
		}			
		
		Part part5 = request.getPart("boardFileName5");
		String filename5 = getFilename(part5);
		
		if(filename5!=null && !filename5.isEmpty()) {
			filename5 = System.currentTimeMillis()+filename5;
			part5.write(uploadDir + "/" + filename5);
			vo.setBoardFileName5(filename5);	
		}			
		
		try {dao.addBoard(vo);} catch (SQLException e) {e.printStackTrace();}
		
		response.sendRedirect("/board/product/productBoard.jsp?tno="+ tno);

    }
    
    private String getFilename(Part part) {
		String headerValue = part.getHeader("Content-Disposition");
		String[] elements = headerValue.split(";");
		for (String el : elements) {
			if (el.trim().startsWith("filename")) {
				return el.substring(el.indexOf("=") +1).replace("\"", "");
			}
		}
		
		return null;
	}
}
