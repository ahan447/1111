<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insert</title>
</head>
<body>
	<form method="post" id="boardform" >
			<label for ="title">제목</label>
			<input type ="text" id="title" name="title" size="30"	/><br/>
			
			<label for="name">작성자</label>
			<input type ="text" id="name" name="name" size="30"	/><br/>
				
			<label for ="content">내용</label>
			<textarea id="content" name="content" cols = "30" rows="10"></textarea>
			<br/>	
			
			<input type="submit" value="작성"/>
			<input type="button" value="메인" id="mainbtn" />
			
			
			
			
			</form>

</body>
<script>
	document.getElementById("mainbtn").addEventListener("click" , function(e){
		location.href = "../";
	});
//form이 있는 경우에는 form의 데이터가 전송될 때 유효성 검사를 수행해 주어야 함
//유효성 검사는 클라이언트 측에서도 하고 서버측에서도 하는 것이 좋음
//클라이언트 측에서 하면 보안은 취약하지만 서버에게 부담을 주지 않고 유효성 검사를 할 수 있음
//클라이언트 측에서 유효성 검사를 수행했지만 서버에서 다시 하게 되는데 이유는 전송 도중에 
//데이터가 변조 되었을 수 도 있기 때문
//로그인의 경우는 일반적인 유효성 검사에 대해서 SQL의 예약어가 포함되어 있는지 확인하는 것이 좋음
//or 가 포함되어 있는지 확인
 document.getElementById("boardform").addEventListener("submit", function(e){
	 
	 //이벤트 객체를 생성하기
	var event = e || window.event;
	//title에 입력된 내용이 없으면 전송하지 않도록 만들기
	var title = document.getElementById("title");
	if(title.value.trim().length < 1){
		alert("제목은 필수 입력사항");
		title.focus();
		event.preventDefault();
		return;
	
	}
	//name에 입력된 내용이 없으면 전송하지 않도록 만들기
	var name = document.getElementById("name");
	if(name.value.trim().length < 1){
		alert("이름은 필수 입력사항");
		name.focus();
		event.preventDefault();
		return;
	}
 });
 
 
</script>

</html>