<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setCharacterEncoding("UTF-8");
// 데이터
//String id = request.getParameter("id");
//String name = request.getParameter("name");
String id = null;
String name = null;
//String name=(String)request.getSession().getAttribute("name");

// 쿠키 
// 특정 쿠키를 얻어오지 못하고 모든 쿠키를 얻어와야댐!
/*
Cookie[] ar = request.getCookies();
if(ar != null){
	for(int i = 0; i < ar.length; i++){
		//String cookieName = ar[i].getName();
		//String cookieValue = ar[i].getValue();
		//System.out.println("쿠키이름 = "+cookieName+"\t값 = "+cookieValue);
		if(ar[i].getName().equals("memName")) name = ar[i].getValue();
		else if(ar[i].getName().equals("memId")) id = ar[i].getValue();
	}
}
*/

// 세션
name = (String)session.getAttribute("memName");
id = (String)session.getAttribute("id");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 OK</title>
</head>
<body>
	<!-- <a  href="../main/index.jsp"><img alt="" src="../image/oh.jpg" width="100" height="100"></a><br> -->
	<img src="../image/oh.jpg" width="100" height="100" onclick="location.href='../main/index.jsp'" style="cursor: pointer"><br>
	<%=name %> 님이 로그인 하셨습니다~<br>
	<input type="button" value="로그아웃" onclick="location.href='logout.jsp'"> &emsp;
	<input type="button" value="회원정보수정" onclick="location.href='modifyForm.jsp'">
</body>
</html>