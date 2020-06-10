<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>

<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="memberDTO" class="member.been.MemberDTO" scope="session" />
<jsp:setProperty name="memberDTO" property="*" />
   
<%
//DB
 MemberDAO memberDAO = MemberDAO.getInstance();
 int su = memberDAO.writeMember(memberDTO); 
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입창~</title>
</head>
<body>
</body>
<script type="text/javascript">
	window.onload = function(){
		alert("회원 가입 완료!")
		location.href="loginForm.jsp"
	}
</script>
</html>





