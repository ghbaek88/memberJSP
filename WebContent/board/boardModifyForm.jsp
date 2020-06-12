<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>

<%
// 데이터 
int seq = Integer.parseInt(request.getParameter("seq"));
int pg = Integer.parseInt(request.getParameter("pg"));

// DB
BoardDAO boardDAO = BoardDAO.getInstance();
BoardDTO boardDTO = boardDAO.getBoard(seq);

String seq2 = Integer.toString(boardDTO.getSeq());
String pg2 = Integer.toString(pg);

session.setAttribute("memSeq2", seq2);
session.setAttribute("memPg2", pg2);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
	<h3>글수정</h3>
	<form name="boardModifyForm" method="post" action="boardModify.jsp">
		<table border="1" cellspacing="0" cellpadding="3">
			<!-- 제목 보여주기 -->
			<tr>
				<td width="100" align="center">제목</td>
				<td><input type="text" size="15" name="subject" id="subject" placeholder="제목입력" value="<%=boardDTO.getSubject() %>"></td>
			</tr>

			<!-- 내용 보여주기 -->
			<tr>
				<td width="100" align="center">내용</td>
				<td><textarea rows="20" cols="50" name="content" placeholder="내용입력" style="resize: none;"><%=boardDTO.getContent() %></textarea></td>
			</tr>
			
			<!-- 버튼 만들기 -->
			<tr>
				<td colspan="2" align="center">
					<input type="button" onclick="checkBoardModifyForm()" value="수정완료"> 
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>
</body>
	<script type="text/javascript">
		function checkBoardModifyForm(){    
			if(document.boardModifyForm.subject.value == ""){
		        alert("제목을 입력하세요.");
		        document.boardModifyForm.subject.focus();
		    } else if(document.boardModifyForm.content.value == "") {
		    	alert("내용을 입력하세요.");
		    	document.boardModifyForm.content.focus();
		    } else  {
		    	document.boardModifyForm.submit();
		    } 
		}
	</script>
</html>