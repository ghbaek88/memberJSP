<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>
    
<%
// 데이터
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

String id = (String)session.getAttribute("memId");

// DB
BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO boardDTO = boardDAO.getBoard(seq);

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 보기</title>
</head>
	<body>
		<table border="1" cellspacing="0" cellpadding="3" frame="hsides" rules="rows" width="600" style="table-layout:fixed;">
			<tr>
				<td colspan="3">제목: <%=boardDTO.getSubject() %></td>		
			</tr> 
			<tr>
				<td width="100">글번호: <%=boardDTO.getSeq()%></td>
				<td width="200">작성자: <%=boardDTO.getName()%></td>
				<td width="100">조회수: <%=boardDTO.getHit()%></td>							
			</tr> 	
			<tr>
				<td  colspan="3" valign=top height="200" style="white-space:pre-wrap; word-break:break-all;  overflow:scroll;"><%=boardDTO.getContent()%></td>	
				<!--<td	colspan="3" valign=top height=100%><pre style="white-space:pre-wrap; font-family:고딕체; height:200px; overflow:scroll;"><%=boardDTO.getContent()%></pre></td>--> 
			</tr> 
		</table>
			<input type="button" value="목록" onclick="location.href='boardList.jsp?pg=<%=pg %>'">
			<% if(id.equals(boardDTO.getId())) {%>
				<input type="button" value="글수정" onclick="location.href='boardModifyForm.jsp?seq=<%=seq %>&pg=<%=pg %>'">
				<input type="button" value="글삭제" onclick="#">
			<%}%>
	</body>

	
</html>


	
		        			
		        			