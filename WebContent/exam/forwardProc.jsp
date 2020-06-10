<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
request.setAttribute("apple", "사과");

// 페이지 이동
RequestDispatcher dispatcher = request.getRequestDispatcher("forwardResult.jsp"); // 절대 안먹는다 상대번지로 해야됨
dispatcher.forward(request, response);
%>
<%-- <jsp:forward page="forwardResult.jsp" /> --%>