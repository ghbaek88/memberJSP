<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@page import="member.been.MemberDTO"%>
<%@page import="java.util.List"%>
    
<%
request.setCharacterEncoding("UTF-8");
// 데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");
MemberDAO memberDAO = new MemberDAO();
String name = memberDAO.loginMember(id, pwd);

// DB


%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%if(name == null){ %>
		로그인 실패!! <br><br>
		<tr>
			<td><input type="button" onclick=location.href='writeForm.jsp' value="회원가입"></td>
		</tr>	
		
	<%} else {%>
		<%=name %> 님이 로그인 하셨습니다~<br><br>
		<tr>
			<td><input type="button" value="로그아웃"> &emsp;
				<input type="button" onclick=location.href='modifyForm.jsp?id=<%=id %>' value="회원정보 수정"></td>
		</tr>	
	<%} %>	
</body>
</html>

