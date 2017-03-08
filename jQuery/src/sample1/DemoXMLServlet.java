package sample1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/food.xml")
public class DemoXMLServlet extends HttpServlet{

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String[] korea = {"된장찌개", "김치찌개", "청국장", "빈대떡"};
		String[] china = {"짜장면", "짬뽕", "탕수육", "양장피"};
		String[] japan = {"초밥", "라멘", "돈까스", "우동"};
		
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		String nation = req.getParameter("na");
		String[] food = {};
		if("kr".equals(nation)) {
			food = korea;
		} else if("ch".equals(nation)) {
			food = china;
		} else if("ja".equals(nation)) {
			food = japan;
		}
		
		StringBuilder sb = new StringBuilder();
		sb.append("<?xml version='1.0' encoding='utf-8' ?>");
		sb.append("<menu>");
		for(String foodName : food) {
			sb.append("<item>"+foodName+"</item>");
		}
		sb.append("</menu>");
		
		out.write(sb.toString());
	}
}
