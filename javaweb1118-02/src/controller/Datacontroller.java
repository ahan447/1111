package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/data/*")
public class Datacontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public Datacontroller() {
        super();
   
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	//	System.out.println("요청 : " + request.getRequestURI());
	//System.out.println("요청 방식 : " + request.getMethod());
	//클라이언트 요청 중에서 구분되는 부분만 잘라내기
		String contextPath = request.getContextPath();
		String requestURI = request.getRequestURI();
		String command = requestURI.substring(contextPath.length());
		
		RequestDispatcher dispatcher = null;
		//GET 을 구분해서 처리
		if("/data/login".equals(command) &&
		"GET".equals(request.getMethod())) {
			//RequestDispatcher dispatcher = request.getRequestDispatcher("");
			//job 디렉토리에 login.jsp 로 포워딩
			 dispatcher = request.getRequestDispatcher("../job/login.jsp");
		dispatcher.forward(request,  response);
		}else if("/data/update".contentEquals(command)) {
			 dispatcher = request.getRequestDispatcher("../job/update.jsp");
			dispatcher.forward(request,  response);
		}else if("/data/read".contentEquals(command)) {
			 dispatcher = request.getRequestDispatcher("../job/read.jsp");
			 
			dispatcher.forward(request,  response);
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
