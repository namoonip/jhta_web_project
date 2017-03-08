package sample1;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/food")
public class DemoServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String koreanFood = "된장국, 김치찌개, 청국장, 빈대떡";
		String chineseFood = "짜장면, 짬뽕, 탕수육, 양장피";
		String japanesFood = "초밥, 우동, 라멘, 돈까스, 오꼬노미야끼";
		
		String nation = req.getParameter("na");
		
		resp.setContentType("text/plain;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		if("kr".equals(nation)) {
			out.write(koreanFood);
		} else if("ch".equals(nation)){
			out.write(chineseFood);
		} else if("ja".equals(nation)) {
			out.write(japanesFood);
		} else {
			out.write("none");
		}
		
	}
	
}