package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vo.Employee;

@WebServlet(urlPatterns={"/employee.hta"})
public class EmployeeServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Employee emp = new Employee();
		emp.setId(100);
		emp.setName("홍길동");
		emp.setEmail("hong@gmail.com");
		emp.setDept("총무부");
		
		// RequestScope에 Employee객체 emp를 "emp"라는 이름으로 저장.
		request.setAttribute("emp", emp);
		
		// 사원정보를 표시해주는 jsp로 이동시키기
		// employee.jsp로 내부 이동시키는 RequestDispatcher 획득
		RequestDispatcher rs = request.getRequestDispatcher("WEB-INF/views/emp/employee.jsp");
		// RequestDispatcher의 foward()를 활용해 employee.jsp로 이동시키고,
		// EmployeeServlet이 실행될 때 전달 받았던 요청객체/응답객체를 전달한다.
		rs.forward(request, response);
	}

}
