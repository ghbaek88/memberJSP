<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
   String realFolder= request.getServletContext().getRealPath("/storage");
   System.out.println("실제폴더"+realFolder);
   //업로드
   MultipartRequest multi = new MultipartRequest(request,realFolder,5*1024*1024,"UTF-8"
            , new DefaultFileRenamePolicy());  //똑같은 이름의 파일이 들어오면 파일 뒤에 번호를 붙여줌
   //데이터
   String subject=multi.getParameter("subject");
   String content=multi.getParameter("content");   
   
   String originalFileName1=multi.getOriginalFileName("upload1");
   String originalFileName2=multi.getOriginalFileName("upload2");
   String fileName1 = multi.getFilesystemName("upload1");
   String fileName2= multi.getFilesystemName("upload2");
   File file1= multi.getFile("upload1");
   File file2= multi.getFile("upload2");
   
   long fileSize1= 0;
   long fileSize2=0;
   if(file1!=null)fileSize1=file1.length();
   if(file2!=null)fileSize2=file2.length();
   %>
   
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>파일이 업로드 되었습니다.</h3>
<ul>
<li>제목:<%=subject %><br>
<li>내용: <pre><%=content%></li></pre><br>
<li>파일: <a href="fileDownload.jsp?fileName=<%=URLEncoder.encode(originalFileName1,"UTF-8") %>"><%=originalFileName1 %></a>
<li>파일: <%=fileName1 %><br>
<li>크기: <%=fileSize1 %><br>
-----------------------------
<li>파일:<%=originalFileName2 %>
<li>파일: <%=fileName2 %><br>
<li>크기: <%=fileSize2 %><br>


</ul>

</body>
</html>