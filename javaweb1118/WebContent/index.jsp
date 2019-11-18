<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<!-- jquery 을 위한 링크 설정 -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script>
//window 객체에 beforeunload 이벤트가 발생하면 - 브라우저 창을 닫을 때
window.addEventListener("beforeunload", function(e){
	//jquery를 이용해서 ajax 수행
	$.ajax({
		url:'logout.jsp'
	});
});
</script>
</head>
<body>
<h3>아침밥먹고싶다</h3>
  	<a href='logout.jsp' target="_blank">로그아웃 체크</a><br/>
  	
  		<h3>CRUD</h3>
  	<ul>
  		<li><a href="insert.do" target="_blank">데이터 삽입</a><br/>
  		<li><a href="read.do" target="_blank">데이터 조회</a><br/>
  		<li><a href="update.do" target="_blank">데이터 수정</a><br/>
  		<li><a href="delete.do" target="_blank">데이터 삭제</a><br/>
  		
  	</ul>
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
  	
</body>
</html>














