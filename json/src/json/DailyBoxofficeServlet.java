package json;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet(urlPatterns={"/boxoffice"})
public class DailyBoxofficeServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// 날짜를 발급받아 사용하기 위해 날짜 선언
		String date = request.getParameter("date");
		
		// key를 발급 받은 후 path를 저장한다.
		String path = "http://www.kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=430156241533f1d058c603178cc3ca0e&targetDt="+date;
		
		// URL을 가져와 파이프 연결하기
		URL url = new URL(path);
		response.setContentType("application/json;charset=utf-8");
		OutputStream os = response.getOutputStream();		
		InputStream is = url.openStream();
		
		IOUtils.copy(is,os);
	}
}
