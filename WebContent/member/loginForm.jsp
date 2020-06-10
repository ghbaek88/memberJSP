<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Form Screen</title>
  <style type="text/css">
   td {background:dodgerblue}  
  </style>  
</head>
<body>
 <h3 align="center">로그인</h3>
  <form name="loginForm" method="post" action="/memberJSP/member/login.jsp">
   <table border="1" cellspacing="0" cellpadding="3" align="center">
   
    <tr>
     <td width="100" align="center">아이디</td>
     <td><input type="text" size="15" name="id" placeholder="아이디입력"></td>
    </tr>
    
    <tr>
     <td width="100" align="center">비밀번호</td>
     <td><input type="text" size="15" name="pwd" placeholder="비밀번호입력"></td>
    </tr>   
    
    <tr> 
     <td colspan="2" align="center">
	 <input type="button" onclick="checkLoginForm()" value="로그인"> &emsp; 
	 <input type="button" onclick=location.href='writeForm.jsp' value="회원가입" ></td>
    </tr>

   </table> 
</body>
<script type="text/javascript" src="../js/member.js"></script>
</html>