package Con;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	//서블릿이 인스턴스 화 될 때 한번만 호출되는 메소드
	@Override
	public void init() {
		System.out.println("초기화 메소드(서블릿>인스턴스화 때 한번");
	}
	
    public BoardController() {
        super();

    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("다이렉트로 관리");



	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
