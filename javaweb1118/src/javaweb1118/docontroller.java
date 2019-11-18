package javaweb1118;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.DataService;
import service.DataServiceImpl;


@WebServlet("*.do")
		
public class docontroller extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
//Service 변수 선언
	private DataService dataService;
	    public docontroller() {
        super();
       //Service 객체 생성
        dataService = DataServiceImpl.sharedInstance();
    }
//get 요청이 오면 처리하는 메소드
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	//GET 과 POST 구분
	//request.getMethod()를 호출하면 요청방식이 리턴
		
	//공통 부분을 제외한 요청 부분을 추출하기
	String contextPath = request.getContextPath();
	String requestURI = request.getRequestURI();
	String command = requestURI.substring(contextPath.length());
	System.out.println(command);
	//java 버전에 따라서 switch에 문자열을 사용할 수 없는 경우가 있는데
	//이 경우는 if로 수정하던가 java 버전을 상위 버전으로 변경
	switch(command) {
	case "/create.do":
		//System.out.println("데이터 삽입 처리");
		dataService.create();
		break;
	case "/read.do":
		//System.out.println("데이터 조회 처리");
		dataService.read();
		break;
	case "/update.do":
		//System.out.println("데이터 수정 처리");
		dataService.update();
		break;
	case "/delete.do":
		//System.out.println("데이터 삭제 처리");
		dataService.delete();
		break;	
	}
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
