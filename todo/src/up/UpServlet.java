package up;

import java.io.IOException;
import java.sql.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import dao.*;
import vo.*;

@MultipartConfig
@WebServlet(urlPatterns="/upload.hta")
public class UpServlet extends HttpServlet{
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		if(session == null) {
			response.sendRedirect("main.jsp?err=deny");
			return;
		}
		
		UserVO user = (UserVO) session.getAttribute("LOGIN_USER");
		request.setCharacterEncoding("utf-8");
		
		// request.getParmeter
		String title = request.getParameter("title");
		String description = request.getParameter("contents");
		String location = request.getParameter("location");
		String day = request.getParameter("day");
		
		Part part = request.getPart("photofile");
		String filename = getFilename(part);
		
		ServletContext application = this.getServletContext();
		String galleryDir = application.getRealPath("gallery");
		
		if(filename!=null && !filename.isEmpty()) {
			part.write(galleryDir + "/" + filename);
		}
		
		
		GalVO vo = new GalVO();
		vo.setTitle(title);
		vo.setDescription(description);
		vo.setLocation(location);
		vo.setDay(day);
		vo.setFilename(filename);
		vo.setUserId(user.getId());
		
		GallDAO dao = new GallDAO();
		try {dao.addGal(vo);} catch (SQLException e)
		{ e.printStackTrace();}
		
		// add DAO
		response.sendRedirect("showGallery.jsp");
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