package sample2;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import vo.Emp;

// json 사용자 입장의 구현
@WebServlet(urlPatterns={"/getData"})
public class DemoJSOPServlet extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		String methodName = req.getParameter("callback");
		System.out.println(methodName);
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		Emp emp = new Emp(100, "홍", "길동", "010-1234-5678", "영업부", 3000000, 0.1);
		Gson gson = new Gson();
		String jsonData = gson.toJson(emp);
		String script = methodName + "(" + jsonData + ")";
		out.write(script);
	}
}