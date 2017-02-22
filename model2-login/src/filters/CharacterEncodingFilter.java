package filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

//@WebFilter(urlPatterns={"*.hta"})
public class CharacterEncodingFilter implements Filter{
	
	private String defaultEncoding = null;
	
	// Filter객체가 생성되고 초기화 작업을 위해 딱 한번 실행된다.
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		defaultEncoding = filterConfig.getInitParameter("encoding");
		if(defaultEncoding == null) {
			defaultEncoding = "UTF-8";
		}
	}
	
	// Filter객체가 소멸되기 전에 딱 한번 실행된다.
	// 연결된 리소스(자원)해제 작업을 코딩하면 된다.
	// 일반적으로 아무 작업을 하지 않는다.
	@Override
	public void destroy() {}
	
	// Filter객체의 실질적인 작업 내용을 구현하는 메소드이다.
	// 클라이언트 요청을 가로채서 서블릿/JSP를 실행 전에 매번 실행된다.
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {
				
		req.setCharacterEncoding(defaultEncoding);
		
		// 이 필터는 다음 필터의 doFilter()메소드를 실행한다.
		// 필터가 더 이상 존재하지 않으면 서블릿/JSP의 service() 메소드를 실행한다.
		// 이 코드 이전에 작성한 코드는 전처리 코드가되고
		// 이 코드 이후에 작성한 코드는 후처리 코드가 된다.
		// 일반적으로 후처리 코드를 작성하는 경우는 거의 없다.
		// doFilter를 적지 않은 경우 다음 번의 필터나 JSP/서블릿을 절대 실행하지 않는다.(주의!)
		// 서버 내부이동은 필터를 통화하지 않고 외부 이동에 해당 URL을 통화할 때 필터가 사용된다.
		filterChain.doFilter(req, res);
	
	}
}
