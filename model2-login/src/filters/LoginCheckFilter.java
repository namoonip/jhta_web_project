package filters;

import java.io.IOException;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginCheckFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	
	@Override
	public void destroy() {}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse res, FilterChain filterChain)
			throws IOException, ServletException {

		HttpServletRequest httpReq = (HttpServletRequest) req;
		HttpServletResponse httpRes = (HttpServletResponse) res;
		
		// http://localhost/model2-login/home.hta
		
		// 요청URL 분석
		// "model2-login/home.hta"과 같다
		String requestURI = httpReq.getRequestURI();	
		
		// contextPath는 웹 애플리케이션을 다른 웹 애플리케이셥과 구분 짓는 경로다.
		// 보통 "/" + (웹 애플리케이션) 프로젝트 이름과 같다. "model2-login"과 같다
		String contextPath = httpReq.getContextPath();
		requestURI = requestURI.replace(contextPath, "");		
		
		// 로그인이 필요없는 URL경로를 담는 Set객체이다.
		Set<String> urlSet = new HashSet<>();
		urlSet.add("/home.hta");
		urlSet.add("/loginform.hta");
		urlSet.add("/login.hta");
		urlSet.add("/form.hta");
		urlSet.add("/add.hta");
		
		//////////// 로그인이 필요한 요청인지 확인
		boolean isRequireLogin = false;
		if(!urlSet.contains(requestURI)) {
			isRequireLogin = true;
		}
		
		if(isRequireLogin) {
			// 로그인이 필요한 URL을 요청한 경우
			HttpSession session = httpReq.getSession(false);
			if(session == null) {
				httpRes.sendRedirect("loginform.hta?err=deny");
				return;
			}
			if(session.getAttribute("LOGINED_USER") == null) {
				httpRes.sendRedirect("loginform.hta?err=deny");
				return;
			}
			
			filterChain.doFilter(req, res);
						
		} else {
			// 로그인이 필요없는 URL을 요청한 경우
			filterChain.doFilter(req, res);
		}
	}
}