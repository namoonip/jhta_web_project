package subway;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet(urlPatterns={"/quick"})
public class SubwayQuickServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		req.setCharacterEncoding("utf-8");
		
		String departure = req.getParameter("d");
		String arrival = req.getParameter("a");
		
		departure = URLEncoder.encode(departure, "utf-8");
		arrival = URLEncoder.encode(arrival, "utf-8");
																												// 1 = 결과
		String path = "http://swopenAPI.seoul.go.kr/api/subway/446b4e476465756e3231734870436a/json/shortestRoute/0/1/"+departure+"/"+ arrival +"/";
		// URL의 정보를 가지고 있는 URL객체를 만든다.
		URL url = new URL(path);
		// URL을 통해 정보를 가져올 파이프를 설치한다.
		InputStream in = url.openStream();
		// inputStream으로 불러온 정보를 outputStream을 통해 바이트 형식으로 보낸다.
		resp.setContentType("application/json;charset=utf-8");
		OutputStream out = resp.getOutputStream(); 
		IOUtils.copy(in, out);
		
	}
}
