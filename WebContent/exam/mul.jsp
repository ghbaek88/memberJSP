<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="dataDTO" class="exam.been.DataDTO" scope="session" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>곱구하기</title>
</head>
<body>
	<h3>mul</h3>
	<jsp:getProperty property="x" name="dataDTO" /> *
	<jsp:getProperty property="y" name="dataDTO"  /> =	
	<%=dataDTO.getX() * dataDTO.getY() %><br><br>
</body>
</html>