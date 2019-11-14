<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Data 클래스의 객체를 생성하는 태그 -->
<jsp:useBean id="data" class="domain.Data"
scope="request" />  
<jsp:setProperty name="data"
property="num" value="2"/>
<jsp:setProperty name="data"
property="name" value="성1기사씨부레"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자바 빈 생성</title>
</head>
<body>
<%
//	data.setNum(1);
//	data.setName("새송");
	data.setBirthday(new java.util.Date());
	
	
	RequestDispatcher dispatcher =
			request.getRequestDispatcher(
					"beanuse.jsp");
	dispatcher.forward(request, response);
	
	
	
%>

</body>
</html>
