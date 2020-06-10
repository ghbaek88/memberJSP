<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Board Screen</title>
	</head>
	<body>
		<h3>글쓰기</h3>
		<form name="boardWriteForm" method="post" action="boardwrite.jsp">
			<table border="1" cellspacing="0" cellpadding="3">
				<!-- 제목 만들기 -->
	   			<tr>
					<td width="100" align="center"> 제목 </td>
					<td><input type="text" size="30" name="subject" id="subject" placeholder="제목 입력"></td>
				</tr>
				
				<!-- 내용 만들기 -->
				<tr>
    				<td width="100" align="center"> 내용 </td>
   					<td><textarea name="content" id="content" rows="15" cols="50"  style="resize:none;" placeholder="내용을 입력"></textarea></td>
				</tr>
	
			   <!-- 버튼 만들기 -->
		   		<tr> 
		    		<td colspan="2" align="center">
					<input type="button" onclick="checkBoardWriteForm()" value="글쓰기">
					<input type="reset" value="다시작성">
					</td>
		   		</tr>  
		</table>
	</form>
</body>
	<script type="text/javascript" src="../js/board.js?var=1"> </script>
</html>