package subway;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet("/subway")
public class SubwayLineServiceServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String lineNumber = req.getParameter("line");
		System.out.println("조회할 노선의 번호 : " + lineNumber);
		
		String path = "http://openapi.seoul.go.kr:8088/587147495765756e3834724d4b5754/json/SearchSTNBySubwayLineService/1/100/"+lineNumber+"/";
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
