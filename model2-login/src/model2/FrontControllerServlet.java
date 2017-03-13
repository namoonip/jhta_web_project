package model2;

import java.io.IOException;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns={"*.hta"})
public class FrontControllerServlet extends HttpServlet{

		@Override
		protected void service(HttpServletRequest request, HttpServletResponse response) 
					throws ServletException, IOException {
			
			String requestUrl = request.getRequestURI().replace("/model2-login", "");
			// 쿼리 스트링은 무시된다.
			
			try {
				ServletContext application = this.getServletContext();
				Map<String, Controller> controllers
					= (Map<String, Controller>) application.getAttribute("controllersMap");
				
				Controller controller = controllers.get(requestUrl);
				
				// 유효하지 않은 url요청인 경우 controller는 null처리.
				if(controller == null) {
					throw new ServletException("유효한 URL이 아닙니다.");
				}
				
				// 컨트롤 실행 후 이동할 경로를 반환한다.
				String path = controller.process(request, response);
				
				if(path == null) {
					throw new ServletException("컨트롤러가 이동한 경로를 반환하지 않습니다.");
				}
				
				String[] arr = path.split(":");
				if(arr[0].equals("forward")) {
					request.getRequestDispatcher("WEB-INF/views/" + arr[1]).forward(request, response);
					
				} else if (arr[0].equals("redirect")) {
					response.sendRedirect(arr[1]);
				}
			
				
			} catch (ServletException e) {
				throw e;
			} catch (Exception e) {
				e.getStackTrace();
				throw new ServletException("유효한 URL이 아닙니다.");			
			}
			
		}
				
}
