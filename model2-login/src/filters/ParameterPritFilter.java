package filters;

import java.io.IOException;
import java.util.Arrays;
import java.util.Map;
import java.util.Set;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class ParameterPritFilter implements Filter{
	
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {}
	
	@Override
	public void destroy() {}
	
	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain filterChain)
			throws IOException, ServletException {
		
		Map<String, String[]> parameterMap = req.getParameterMap();
		Set<String> keys = parameterMap.keySet();
		
		for(String key : keys) {
			System.out.println("["+key+"]" + Arrays.toString(parameterMap.get(key)));
		}
		
		filterChain.doFilter(req, resp);
	}
}
