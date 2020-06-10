<%@page import="board.bean.BoardDTO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="board.dao.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");
// 데이터받기
int pg = Integer.parseInt(request.getParameter("pg"));
// DB
BoardDAO boardDAO = BoardDAO.getInstance();

// 페이징 처리
int endNum = pg * 5;
int startNum = endNum - 4;
ArrayList<BoardDTO> ar = boardDAO.getBoardList(startNum, endNum);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List Screen</title>
</head>
	<body>
		<table style="border-top: 1px solid #000000;">
			<tr>
				<th width=100;>글번호</th>
				<th width=200;>제목</th>
				<th width=100;>작성자</th>
				<th width=100;>작성일</th>
				<th width=100;>조회수</th>				
			</tr> 
			<% for(BoardDTO boardDTO : ar){%>
			<tr>
				<th width=100;><%= boardDTO.getSeq()%></th>
				<td width=200;><a href="#" style="cursor:hand; text-decoration: none;"><%= boardDTO.getSubject()%></a></td>
				<th width=150;><%= boardDTO.getName()%></th>
				<th width=100;><%= boardDTO.getLogtime()%></th>
				<th width=100;><%= boardDTO.getHit()%></th>				
			</tr> 			
			<%} %>
		</table>
	</body>
</html>