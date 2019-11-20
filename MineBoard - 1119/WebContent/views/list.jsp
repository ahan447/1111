<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"
    uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 목록 보기</title>
</head>
<body>
<h3 align='center'>게시판</h3>
<table align='center' border='1'>
	<tr>
		<th width="5%">글번호</th>
		<th width="45%">제목</th>
		<th width="20%">작성일</th>
		<th width="10%">조회수</th>
		<th width="20%">작성일</th>
		</tr>
		<!-- list 순회' -->
		<c:forEach var="board" items="${list}">
		<tr>
		<td align='right'>${board.num}</td>
		<td><a href='detail?num=${board.num}'>&nbsp;&nbsp;${board.title}</a></td>
		<td>&nbsp;&nbsp;${board.name}</td>
		<td align='right'>${board.cnt}</td>
		<td align='center'>${board.dispdate}</td>
		</tr>
		</c:forEach>
		
		
		<br/>
		<a href="../index.jsp">처음화면</a>
</table>
</body>
</html>