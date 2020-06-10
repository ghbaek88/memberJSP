<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<jsp:useBean id="dataDTO" class="exam.been.DataDTO" scope="session" />
<jsp:setProperty name="dataDTO" property="x" />
<jsp:setProperty name="dataDTO" property="y" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>합구하기</title>
</head>
<body>
	 <form method="get" action="mul.jsp">
	<h3>sum</h3>
	<jsp:getProperty property="x" name="dataDTO" /> +
	<jsp:getProperty property="y" name="dataDTO"  /> =	
	<%=dataDTO.getX() + dataDTO.getY() %><br><br>
	

	<input type="submit" value="곱구하기">
	</from>
</body>
</html>