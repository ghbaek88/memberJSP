<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>    
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
    
<% 

request.setCharacterEncoding("UTF-8");
//데이터받아오기
String subject = request.getParameter("subject");
String content  = request.getParameter("content");

String seq = (String)session.getAttribute("memSeq2"); 
String pg = (String)session.getAttribute("memPg2");

// DB
Map<String, String> map = new HashMap<String, String>();
map.put("seq", seq);
map.put("subject", subject);
map.put("content", content);

BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.modifyBoard(map);

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글수정</title>
</head>
<body>
</body>
	<script type="text/javascript">
		window.onload=function(){
			alert("작성하신 글을 수정하였습니다.");
			location.href="boardList.jsp?pg="+<%=pg%>;
		}
	</script>
</html>