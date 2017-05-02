package testEx;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/book.do")
public class AjaxTestEx extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int no = Integer.parseInt(req.getParameter("no"));
		boolean success = false;
		if(no == 23) {
			success = true;
			System.out.println();
		}
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		StringBuilder sb = new StringBuilder();
		sb.append("<?xml version='1.0' encoding='utf-8'?>");
		sb.append("<book>");
		sb.append("<title>자바의 정석</title>");
		sb.append("<author>남궁성</author>");
		sb.append("<price>3,5000원</price>");
		sb.append("</book>");
		
		out.write(sb.toString());		
	}
}
