<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h3>회원가입</h3>
	<form method="post" enctype="multipart/form-data" id="joinform">
		<table align='center' width="50%" height="300" border="1">
			<tr>
				<td rowspan="6" align="center"><br />
				 <img src="" id="img"
					width="300" height="300" border="1" />
					 <input type="file" id="image"
					name="image" accept="image/*" /></td>
			</tr>
			<tr>
				<td>이메일</td>
				<td><input type="email" name="email"
				required="required" size="30" maxlength="40"/>
				<div id="emaildisp" ></div>
				</td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="password" id="password"
				required="required" size="30" maxlength="40"/>
				<div id="passworddisp" ></div>
				</td>	
			</tr>	
			<tr>
				<td align='right'>이름</td>
				<td><input type="text" name="name" id="name"
				required="required" size="30" maxlength="40"/>
				<div id="namedisp" ></div>
				</td>	
			</tr>	
			<tr>
				<td align='right'>별명</td>
				<td><input type="text" name="nickname" id="nickname"
				required="required" size="30" maxlength="40"
				placeholder="별명은 필수 입력"/>
				<div id="nicknamedisp" ></div>
				</td>	
			</tr>	
			<tr>
				<td align="right">생년월일</td>
				<td>
					<select name="year">
					<c:forEach var="year" begin="1920" end="2019">
					<option value="${year}">${year}</option>
					</c:forEach>
					</select>년
					
					<select name="month">
					<c:forEach var="month" begin="1" end="12">
					<option value="${13-month}">${13-month}</option>
					</c:forEach>
					</select>
					
					<select name="dy">
					<c:forEach var="day" begin="1" end="31">
					<option value="${day}">${day}</option>
					</c:forEach>
					</select>일
			</tr>
			
			<tr>
			<td colspan = "3" align="center">
			<input type="submit" value="회원가입" />
			&nbsp;&nbsp;
			<input type="button" value="메인으로" id="mainbtn"/>
			</td>
			</tr>
			
			
		</table>
	</form>
<script>
//메인을 버튼을 눌렀을때 메인페이지로 이동
document.getElementById("mainbtn").addEventListener("click", function(e){
	location.href= "../";
});
//파일의 선택의 변경된 경우 선택한 파일을 img 태그에 출력하기
document.getElementById("image").addEventListener('change', function(e){
	//선택한 파일이 있는지 확인
	if(this.files && this.files[0]){
		//선택한 파일 이름 가져오기
		filename = this.files[0].name;
		//파일 읽기 객체 생성
		var reader = new FileReader();
		//파일 읽기
		reader.readAsDataURL(this.files[0]);
		//파일을 전부 읽으면 img 태그에 출력
		reader.addEventListener('load' , function(e){
			var event = e || window.event;
			document.getElementById('img').src = event.target.result;
		});
	}
});

//email 입력 영역과 이메일 관련 메시지 출력영역을 찾아오기
var email = document.getElementById("email");
var emaildisp = document.getElementById("emaildisp");
var corp = document.getElementById("corp");

// 이메일 체크 여부를 저장하기 위한 변수
var emailcheck = false;

function f(e){
	var event = e || window.event;
	// 입력한 값 가져오기
	var val = email.value.trim();
	if(val.trim().length <= 0){
		emaildisp.innerHTML = "이메일을 입력하세요";
		emaildisp.style.color = "RED";
		email.focus;
		event.preventDefault();
	}
	//val = val + "@" + corp.value;
	else if(val.length > 1){
		//val = val + "@" + corp.value;
		// ajax 객체 생성
		var request = new XMLHttpRequest();
		// ajax 요청 경로 생성
		request.open("GET", "emailcheck?email=" + val);
	// 요청 전송
		request.send("");
		// 응답이 왔을 때 호출되는 콜백(Callback - 이벤트가 발생하면 호출되는) 메소드 등록
		request.onreadystatechange = function(e){
			if(request.readyState == 4){
				// 서버가 정상적으로 처리하고 정상 응답을 하면
				if(request.status >= 200 && request.status < 300){
					// 전송되어 온 데이터 확인
					var result = request.responseText;
					if(result.trim() == "true"){
						emaildisp.innerHTML = "사용 가능한 이메일";
						emaildisp.style.color = "BLUE";
						emailcheck = true;
					}else{
						emaildisp.innerHTML = "사용 불가능한 이메일";
						emaildisp.style.color = "RED";
						emailcheck = false;
					}
				}else{
					alert(request.status);
				}
			}
		};
	}	
}



	
	var nickname = document.getEvertById("nickname");
	var nicknamedisp = documentl.getElementById("nickname");
	
	var  nicknameCher= false;
	
	nickname.addEventListener("focusout", function(e){
		var val = nickname.value;
		//닉네임을 입력하지 않았으면 닉네임 중복체크를 하지 않음
		if(val.trim().legth< 1){
			 nicknamecheck = false;
			return;
		}});
		//자바스크립트에서의 인코딩
		//URL 이나 파라미터에는 영문과 숫자를 제외하고는 인코딩을 되서 대입되어야 함
		//val = escape(val);
		
		
		var request = new XMLHttpRequesdt();
		reqyest.open('GET', 'nicknamecheck?nickmene =' + val);
		request.send('');
		request.onreadystatechange = function(e){
			//readyState는 서버로 오는 응답의 상태 : 4번이 응답을 한 경우
			//0은 객체만 생성한 상태, 1이면 요청을 한 상태
			//2이면 send()를 호출한 상태, 3이면 서버에서 응답이 오기 시작한 상태
			if(request.readState ==4){
				//100번대 처리 중, 200번대 정상응답
				//300번대 리다이렉트 , 400번대 클라이언트 오류
				//500번대는 서버오류
				if(request.statue >= 200 && request.status < 300){
					var result = request.responseText;
					//JSON Parsion
					var obj = JSON.parse(result);
					//동일한 닉네임이 없는 경우
					if(obj.result == "true"){
						nicknamedisp.innerHTML = "사용 가능한 닉네임";
						nicknamedisp.style.color = 'blue'
						nicknamecheck = true;
					}
					//동일한 닉네임이 있는 경우
					else{
						nicknamedisp.innerHTML = "사용 가능한 닉네임";
						nicknamedisp.style.color = 'red'
						nicknamecheck = false;
						
					}
				}
			}
		};
	
	//폼의 데이터를 전송할 때
	document.getElementById('joinform').addEventListener(
			'submit' , function(e){
				//이벤트 객체 생성
				var event = e || window.event;
				
				if(emailcheck == false){
					email.focus();
					emaildisp.innerHTML = "이메일이 유효하지 않음"
					emaildsip.style.color = "red";
					//기본 이벤트 제거 - 폼의 데이터를 전송하지 않음
					event.preventDefault();
					return;
				}
				if(nicknamecheck == false){
					email.focus();
					emaildisp.innerHTML = "별명이 유효하지 않음"
					emaildsip.style.color = "red";
					//기본 이벤트 제거 - 폼의 데이터를 전송하지 않음
					event.preventDefault();
					return;}
				
			});
	</script>
</body>
</html>