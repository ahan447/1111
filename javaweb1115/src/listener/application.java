package listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class application implements ServletContextListener {

	@Override
	public void contextDestroyed(ServletContextEvent arg0) {
		System.out.println("웹 애플리케이션 종료");

	}

	@Override
	public void contextInitialized(ServletContextEvent arg0) {
		System.out.println("웹 애플리케이션 시작");

	}

}
