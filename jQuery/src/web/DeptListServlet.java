package web;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.EmpDao;
import vo.Dept;

@WebServlet("/depts")
public class DeptListServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		resp.setContentType("application/json;charset=utf-8");
		PrintWriter out = resp.getWriter();
		
		Gson gson = new Gson();
		EmpDao dao = new EmpDao();
		try {
			List<Dept> deptList = dao.getAllDept();
			String jsonText = gson.toJson(deptList);
			out.write(jsonText);
		} catch(SQLException e) {
			e.getStackTrace();
			out.write("[]");
		}
	}
}