
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="board.bean.BoardDTO"%>
<%@page import="board.dao.BoardDAO"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>

<%
request.setCharacterEncoding("UTF-8");
// 데이터받아오기
String subject = request.getParameter("subject");
String content  = request.getParameter("content");

String id = (String)session.getAttribute("memId");
String name = (String)session.getAttribute("memName");
String email = (String)session.getAttribute("memEmail");
// 몇개 안되는 데이터만 넘길때는 map을 쓴다.
Map<String, String> map = new HashMap<String, String>();
map.put("id", id);
map.put("name", name);
map.put("email", email);
map.put("subject", subject);
map.put("content", content);

BoardDAO boardDAO = BoardDAO.getInstance();
boardDAO.writeBoard(map);
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Board Screen</title>
</head>
<body>

</body>
	<script type="text/javascript">
		window.onload=function(){
			alert("작성하신 글을 저장 하였습니다.");
			location.href="../main/index.jsp";
		}
	</script>
</html>