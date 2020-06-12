<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="board.bean.BoardPaging"%>
<%@ page import="java.util.Date"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ page import="board.dao.BoardDAO"%>
<%@	page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.ArrayList"%>

<%
request.setCharacterEncoding("UTF-8");
// 데이터받기
int pg = Integer.parseInt(request.getParameter("pg"));
String loginMem = (String)session.getAttribute("memId");
// DB
BoardDAO boardDAO = BoardDAO.getInstance();

int endNum = pg * 5;
int startNum = endNum - 4;

ArrayList<BoardDTO> ar = boardDAO.getBoardList(startNum, endNum);

SimpleDateFormat ft = new SimpleDateFormat("YYYY.MM.dd");
SimpleDateFormat today = new SimpleDateFormat("YYYY.MM.dd HH:mm:ss");
SimpleDateFormat past = new SimpleDateFormat("YYYY.MM.dd");
Date current= new Date();
String currentTime = ft.format(current);

//페이징 처리
BoardPaging boardPaging = new BoardPaging(); 
int totalA = boardDAO.getTotalA(); // 총글수
boardPaging.setCurrentPage(pg);
boardPaging.setPageBlock(3);
boardPaging.setPageSize(5);
boardPaging.setTotalA(totalA);
boardPaging.makePagingHTML();

%>
<style>
#currentPaging {color: red; text-decoration: underline;}
#paging {color: black; text-decoration: none;}
</style>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board List Screen</title>
</head>
	<body>
		<table border="1" cellspacing="0" cellpadding="3" frame="hsides" rules="rows">
			<%if(ar != null){ %>
				<tr>
					<th width="100">글번호</th>
					<th width="200">제목</th>
					<th width="150">작성자</th>
					<th width="100">작성일</th>
					<th width="100">조회수</th>				
				</tr> 
				<% for(BoardDTO boardDTO : ar){%>
				<tr>					
					<% String logtime = ft.format(boardDTO.getLogtime()).equals(currentTime)?today.format(boardDTO.getLogtime()): past.format(boardDTO.getLogtime());%>
					<th width="100"><%= boardDTO.getSeq()%></th>
					<td width="200"><a href="#" onclick="checkLoginMem('<%= boardDTO.getSeq()%>','<%=pg %>')" style="cursor:hand; text-decoration: none;"><%= boardDTO.getSubject()%></a></td>
					<th width="150"><%= boardDTO.getName()%></th>
					<th width="100"><%= logtime%></th>
					<th width="100"><%= boardDTO.getHit()%></th>			
				</tr> 			
				<%} %>
			<% }%>
		</table>
			<div style=" width:650px; text-align: center;"><%=boardPaging.getPagingHTML()%></div>
	</body>
	<script type="text/javascript">
		function checkLoginMem(seq,pg){
			   if('<%=loginMem%>'=='null') {
				   alert("로그인을 먼저 하세요");
				   location.href="../main/index.jsp";
			   }
			   else location.href="boardView.jsp?seq="+seq+"&pg="+pg;
		}	
	</script>
</html>