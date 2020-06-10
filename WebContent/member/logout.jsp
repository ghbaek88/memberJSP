<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
// 쿠키 가져와서 삭제하기
/*
Cookie[] ar = request.getCookies(); // 쿠키 가져오기
if(ar != null){
	for(int i = 0; i < ar.length; i++){
		if(ar[i].getName().equals("memName")){
			ar[i].setMaxAge(0); // 쿠키 삭제
			response.addCookie(ar[i]);
		}else if(ar[i].getName().equals("memId")){
			ar[i].setMaxAge(0); // 쿠키 삭제
			response.addCookie(ar[i]);
		}
	}
}
*/

// 세션 삭제
//session.removeAttribute("memName");
//session.removeAttribute("memId");

// 세션 한번에 무효화
session.invalidate();
%>    



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>logout Screen</title>
</head>
<body>

</body>
<script type="text/javascript">
	window.onload=function(){
		alert("로그아웃");
		location.href="../main/index.jsp";
	}
</script>
</html>