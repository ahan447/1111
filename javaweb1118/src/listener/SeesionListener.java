package listener;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SeesionListener implements HttpSessionListener {
	
	@Override
	public void sessionCreated(HttpSessionEvent arg0) {
		//세션이 만들어 질때 호출되는 메소드
		System.out.println("유저 접속");
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent arg0) {
		//세션이 소멸 될 때 호출되는 메소드
		//로그아웃 할 때 - session 이 invalidate 될 때
		System.out.println("접속 해제");

	}

}
