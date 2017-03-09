package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.EmpDao;
import vo.Emp;

@WebServlet("/emp")
public class EmpDetailServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		int empId = Integer.parseInt(req.getParameter("id"));
		
		Gson gson = new Gson();
		EmpDao dao = new EmpDao();
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		try{
			Emp emp = dao.getEmp(empId);
			String jsonText = gson.toJson(emp);
			out.write(jsonText);
		} catch(SQLException e) {
			e.getStackTrace();
			out.write("[]");
		}
	
	}
}

