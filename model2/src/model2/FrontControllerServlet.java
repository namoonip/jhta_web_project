package model2;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.HomeController;
import controller.ListController;

@WebServlet(urlPatterns={"*.hta"})
public class FrontControllerServlet extends HttpServlet{

		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String requestUrl = request.getRequestURI().replace("/model2", "");
			// 쿼리 스트링은 무시된다.
			System.out.println("요청 URL: " + requestUrl);
			
			try {
				if("/home.hta".equals(requestUrl)) {
					HomeController controller = new HomeController();
					controller.process(request, response);
				} else if("/list.hta".equals(requestUrl)) {
					ListController controller = new ListController();
					controller.process(request, response);
				}				
			} catch (Exception e) {
				e.getStackTrace();
			}
		}
		
		
}
