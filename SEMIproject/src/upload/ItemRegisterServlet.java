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

import dao.itemRegisterDAO;
import vo.ItemVO;

@MultipartConfig
@WebServlet(urlPatterns={"/itemregister"})
public class ItemRegisterServlet extends HttpServlet {
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
			request.setCharacterEncoding("utf-8");
			
			int itemCategory = Integer.parseInt(request.getParameter("categoryNo"));
			String itemName = request.getParameter("name");
			int itemCount = Integer.parseInt(request.getParameter("count"));
			int itemPrice = Integer.parseInt(request.getParameter("price"));
			String itemColor = request.getParameter("color");
			String itemSize = request.getParameter("size");
			int itemGroupNo = Integer.parseInt(request.getParameter("groupNo"));
			String itemEtc = request.getParameter("etc");
			
			
			//상세이미지 파트
			Part part = request.getPart("src");
			Part part1 = request.getPart("viewSrc");
			
			
			String filename = getImageName(part);
			String filename2 = getImageName(part1);
			
			String itemDir = "C:\\web_project\\workspace\\SEMIproject\\WebContent\\itemImage";
			
			if(filename != null && !filename.isEmpty()){
				filename = System.currentTimeMillis()+filename;
				part.write(itemDir +"/" + filename);
			}
			
			if(filename2 != null && !filename2.isEmpty()){
				filename2 = System.currentTimeMillis()+filename2;
				part1.write(itemDir +"/" + filename2);
			}
			
			ItemVO item = new ItemVO();
			item.setSrc(filename);
			item.setViewSrc(filename2);
			item.setCategoryNo(itemCategory);
			item.setName(itemName);
			item.setCount(itemCount);
			item.setPrice(itemPrice);
			item.setColor(itemColor);
			item.setSize(itemSize);
			item.setGroupNo(itemGroupNo);
			item.setEtc(itemEtc);
			
			
			itemRegisterDAO dao = new itemRegisterDAO();
			try{
				dao.addItemRegister(item);
			}catch(SQLException e){
				e.printStackTrace();
			}
			response.sendRedirect("/admin/adminProductRegistration.jsp#naviTarget");
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
