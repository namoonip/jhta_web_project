package repo;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.IOUtils;

@WebServlet(urlPatterns="/download")
public class FileDownloadServlet extends HttpServlet{
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String directory = "c:/web_project/repo"; 
		
		// 실제로는 번호로 주고 받음
		String filename = req.getParameter("name");
		
		// 한글 처리
		String encodedFileName = URLEncoder.encode(filename, "utf-8");
		System.out.println("인코딩된 파일 이름:" + encodedFileName);
		
		// 다운로드 타입을 설정
		resp.setContentType("application/octet-stream");
		
		// 파일이 열리는 것이 아닌 다운로드로 헤더 설정
		resp.setHeader("Content-Disposition", "attachment;filename=" + encodedFileName);
		
		// 해당 파일을 경로에서 불러오기
		FileInputStream fis = new FileInputStream(new File(directory, encodedFileName));
		// 불러온 파일을 response의 OutputStream을 통해 내보낸다.
		OutputStream os = resp.getOutputStream();
		
		IOUtils.copy(fis, os);
		/* 아래와 같다.
		byte[] buf = new byte[1024*8];
		int len = 0;
		while((len=fis.read(buf)) != -1) {
			os.write(buf, 0, len);
		}*/
	}
}

