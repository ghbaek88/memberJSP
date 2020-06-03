<%@ page import="member.dao.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
 // 데이터
 String id = request.getParameter("id");
 // DB
 MemberDAO memberDAO = MemberDAO.getInstance();
 boolean exist = memberDAO.isExistId(id);
%>
<!DOCTYPE html>
<html>
 <head>
  <meta charset="UTF-8">
  <title>Insert title here</title>
 </head>
<body>
 <form method="post" action="checkId.jsp">
  <%if(exist){%>
  	ID: <%=id%> 사용불가능 <br><br>  	
  <tr>
   <td align="center">아이디 </td>
   <td><input type="text" name="id">
   	   <input type="submit" value="검색"></td>
  </tr>   
  <%}else{%>
  	ID: <%=id%> 사용가능 <br><br>
  	<input type="button" value="사용하기" onclick="checkIdClose('<%=id%>')">
  <%}%> 
 </from>
</body>
<script type="text/javascript" src="../js/member.js"></script> <!-- 상대 번지이다 -->
</html>