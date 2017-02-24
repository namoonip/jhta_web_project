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
import javax.servlet.http.Part;

import dao.GalleryDAO;
import vo.GalleryVO;

// ��Ƽ��Ʈ��û�� ó���� �� �ִ� �������� �����Ѵ�.
@MultipartConfig
@WebServlet(urlPatterns="/upload.hta")
public class UploadServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
		request.setCharacterEncoding("utf-8");
		
		String username = request.getParameter("username");
		String description = request.getParameter("description");
		System.out.println("username: " + username);
		System.out.println("description: "+ description);
		
		Part part = request.getPart("photofile");
		String filename = getFilename(part);	
		
		// ���� ��� �˾Ƴ���
		ServletContext application = this.getServletContext();
		String galleryDir = application.getRealPath("gallery");
		System.out.println("������ ���丮���: " + galleryDir);
		
		// ÷�� ������ �ִ� ���
		if (filename != null && !filename.isEmpty()) {
			System.out.println("÷�����ϸ�: " + filename);

			// ������ gallery������ �����ϱ�
			part.write(galleryDir + "/" + filename);
		}
		
		GalleryVO vo = new GalleryVO();
		vo.setUsername(username);
		vo.setDescription(description);
		vo.setFilename(filename);
		
		GalleryDAO dao = new GalleryDAO();
		try {dao.addGallery(vo);} catch (SQLException e) {e.printStackTrace();}
		
		response.sendRedirect("gallery.jsp");
		
	}
	
	// ���� �̸��� �޾ƿ���
	private String getFilename(Part part) {
		String headerValue = part.getHeader("content-disposition");
		String[] elements = headerValue.split(";");
		for (String el : elements) {
			// filename으로 시작하는지 체크
			if(el.trim().startsWith("filename")) {
				return el.substring(el.indexOf("=") + 1).replace("\"", "");
			}
		}
		return null;
	}
}




