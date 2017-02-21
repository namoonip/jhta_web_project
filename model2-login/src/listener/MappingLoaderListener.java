package listener;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import model2.Controller;

public class MappingLoaderListener implements ServletContextListener{
	
	@Override
	public void contextInitialized(ServletContextEvent event) {
		
		ServletContext application =  event.getServletContext();
		
		try {
			Map<String, Controller> controllers = new HashMap<>();
			
			Properties prop = new Properties();
			prop.load(this.getClass().getResourceAsStream("../config/mapping.properties"));
			// "/home.hta=controller.HomeController"가 로드됨
			
			Set<Object> keys = prop.keySet();
			// "/home.hta"만 로드됨
			
			for(Object key : keys) {
				String className = prop.getProperty((String)key);
				// "controller.HomeController"가 로드됨
				
				Controller controller = (Controller) Class.forName(className).newInstance();
				// 클래스 이름으로 Controller를 implement한 controller객체가 로드됨.
				
				controllers.put((String)key, controller);
				// /homt.hta라는 key값에 controller객체 HomeController가 저장됨.
			}
			
			application.setAttribute("controllersMap", controllers);
			// application 속성에 Controller 객체가 저장된 Map을 저장함
			
		} catch(IOException e) {
			throw new RuntimeException(e);
		} catch(ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch(IllegalAccessException e) {
			throw new RuntimeException(e);
		} catch(InstantiationException e) {
			throw new RuntimeException(e);
		}
		
	}
	
	public void contextDestroyed(ServletContextEvent event) {
		System.out.println("contextDestroyed ...............");		
	}
}
