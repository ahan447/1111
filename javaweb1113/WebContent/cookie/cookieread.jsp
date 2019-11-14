<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>쿠키 읽기</title>
</head>
<body>
	<%
		//클라이언트가 전송한 모든 쿠키 가져오기
		Cookie [] cookies =
			request.getCookies();
	//빠른 열겨는 오른쪽에 데이터의 집합이 null 일 때는
	//NullpointerException이 발생
	//데이터가 1개도 없으면 이 경우는 정상 처리
	if(cookies != null){
	for(Cookie cookie : cookies){
			out.println(
					"<h3>" + cookie.getName() +
					" : " + cookie.getValue() + "</h3>");
 										
	}
	//기존에 존재하는 쿠키의 값을 새로 설정해서 추가
	Cookie cookie = new Cookie("id" , "saesong");
	response.addCookie(cookie);
	
	//유효시간을 0으로 설정해서 추가
	cookie =
	new Cookie("nickname" , "saesong2");
	cookie.setMaxAge(0);
	response.addCookie(cookie);
	
	}else{
	out.println("<h3>쿠키없음</h3>");	
	}	
	
	%>
	<a href="cookieupdate.jsp">쿠키 수정과 삭제
	</a>
</body>
</html>