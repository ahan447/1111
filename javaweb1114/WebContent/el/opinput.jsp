<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>List 와 Map 생성</title>
<%@ page import = 'java.util.*' %>
<%
	//문자열을 저장할 수 있는 List 생성
	List<String>list = new ArrayList<String>();
list.add("연우");
list.add("아이린");
list.add("시연");
list.add("");

Map<String,Object> map =
new HashMap<String, Object>();
map.put("신예은","21");
map.put("이영은","37");
map.put("문채원","32");

session.setAttribute("list", list);
session.setAttribute("map", map);

%>


</head>
<body>
<a href="opoutput.jsp">연산자 사용</a>
</body>
</html>