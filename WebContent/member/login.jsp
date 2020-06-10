<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@page import="member.been.MemberDTO"%>
<%@page import="java.net.URLEncoder"%>

<!-- 여기서부터는 자바 문법 -->    
<%
request.setCharacterEncoding("UTF-8");
// 데이터
String id = request.getParameter("id");
String pwd = request.getParameter("pwd");

// DB
MemberDAO memberDAO = new MemberDAO();
MemberDTO memberDTO  = memberDAO.loginMember(id, pwd);

String name = memberDTO.getName();
String email = memberDTO.getEmail1()+"@"+memberDTO.getEmail2();

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%if(memberDTO == null){		
			response.sendRedirect("loginFail.jsp");		
	} else {
		/*
			// 쿠키 생성
			Cookie cookie = new Cookie("memName", name); // 쿠키에 이름을 저장한다.
			cookie.setMaxAge(30*60); // 쿠키를 3초동안 만든다?
			// 클라이언트에게 쿠키 보내주기
			response.addCookie(cookie);
			
			Cookie cookie2 = new Cookie("memId", id); // 쿠키에 아이디를 저장한다.
			cookie2.setMaxAge(30*60); // 쿠키를 3초동안 만든다?
			// 클라이언트에게 쿠키 보내주기
			response.addCookie(cookie2);
			
			// 페이지 이동 
			
			response.sendRedirect("loginOk.jsp?name="+URLEncoder.encode(name,"UTF-8")+"&id="+id);
			request.getSession().setAttribute("name", name);
			request.getSession().setAttribute("id", id);	
			*/
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			session.setAttribute("memEmail", email);
			/*
			session.setAttribute("memDTO", memberDTO);
			session 에서는 DTO 객체를 넘겨도된다
			*/
			response.sendRedirect("loginOk.jsp");
	}%>	
</body>
</html>

