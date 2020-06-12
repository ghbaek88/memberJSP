<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="java.io.BufferedInputStream"%>
<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.File"%>
    
<%
// 데이터
String fileName = request.getParameter("fileName"); //파일명
String realFolder = request.getServletContext().getRealPath("/storage"); //실제 폴더

//다운로드 받을 파일 생성
File file = new File(realFolder, fileName);

fileName = URLEncoder.encode(fileName, "UTF-8").replace("+"," ");

response.setHeader("Content-Disposition","attachment;fileName="+fileName);
response.setHeader("Content-Length",file.length()+"");

/*
getOutputStream() has already bean called for this response
JSP에서는 SERVLET으로 변환할 때 내부적으로 out 객체가 자동으로 생성하기 때문에 따라
out객체를 만들면 충돌이 일어나서 저런 메세지가 뜨는 것이다.
그래서 먼저 out를 초기화하고 생성하면 된다.
*/
out.clear();
out = pageContext.pushBody();

//다운로드

BufferedInputStream bis = new BufferedInputStream(new FileInputStream(file));
BufferedOutputStream bos = new BufferedOutputStream(response.getOutputStream());
int size = (int)file.length();
byte[] b = new byte[size];
bis.read(b,0,size);  //0번째 방부터 size크기만큼 읽기
bos.write(b);

bis.close();
bos.close();


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Download</title>
</head>
<body>

</body>
</html>