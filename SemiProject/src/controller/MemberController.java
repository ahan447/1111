package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.MemberService;
import service.MemberServiceImpl;

@WebServlet("/member/*")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService;

	public MemberController() {
		super();

		memberService = MemberServiceImpl.ShardeInstance();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String requestURI = request.getRequestURI();
		int lastIdx = requestURI.lastIndexOf("/");
		String command = requestURI.substring(lastIdx + 1);

		// 포워딩에 사용할 변수
		RequestDispatcher dispatcher = null;

		switch (command) {
		case "join":
			if ("GET".equals(request.getMethod())) {
				dispatcher = request.getRequestDispatcher("../views/mem/join.jsp");
				dispatcher.forward(request, response);
			} else {

			}
			break;
		case "emailcheck" :
			boolean result = memberService.emailCheck(request);
			//데이터를 저장하고 포워딩 - 포워딩 할 때는 request에 데이터를 저장
			request.setAttribute("result", result);
			dispatcher=
					request.getRequestDispatcher("../views/mem/emailcheck.jsp");
			dispatcher.forward(request, response);
			break;
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
