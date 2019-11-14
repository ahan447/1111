<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 처</title>
</head>
<body>
	<%
		//파라미터 인코딩 설정
		request.setCharacterEncoding("UTF-8");
	
		//파라미터 읽기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		//결과 메시지 변수
		String msg;
		
		if(id.equals("ABC") && pw.equals("2323")){
			msg = "로그인 성공";
		}else{
			msg = "로그인 실패";
		}		
		
		//결과 페이지로 이동
		/* 포워딩 */
		//request.setAttribute("msg", msg);
		session.setAttribute("msg", msg);
		/*
		RequestDispatcher dispatcher =
			request.getRequestDispatcher(
					"loginresult.jsp");
		dispatcher.forward(request, response);
		*/
		response.sendRedirect("loginresult.jsp");
		
		
		
		
		
	%>
</body>
</html>