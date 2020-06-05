<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@page import="member.been.MemberDTO"%>
<%@page import="java.util.List"%>
    
<%
// 데이터
String id = request.getParameter("id");

//DB
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = memberDAO.modifyMember(id);

%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원정보 수정</title>
  <style type="text/css">
   td {background:dodgerblue}  
  </style>  
</head>
<body>
<h3 align="center">회원정보 수정</h3>
 <form name="modifyForm" method="post" action="modify.jsp">
  <table border="1" cellspacing="0" cellpadding="3" align="center">

   <tr>
    <td width="100" align="center"><font color="red"> * </font> 이름 </td>
    <td><input type="text" size="15" name="name" id="name" placeholder="이름입력" value="<%=memberDTO.getName() %>"></td>
   </tr>
  
   <tr>
    <td align="center"><font color="red"> * </font> 아이디 </td>
    <td><input type="text" size="15" name="id" value="<%=memberDTO.getId() %>" readonly></td>
   </tr>
   
   <tr> 
    <td align="center"><font color="red"> * </font> 비밀번호 </td>
	<td> <input type="password" size="15" name="pwd" ></td>
   </tr>
   
   <tr> 
    <td align="center"><font color="red"> * </font> 재확인 </td>
	<td> <input type="password" size="15" name="repwd" ></td>
   </tr>

   <tr> 
    <td align="center">성별</td>
	<td> <input type="radio" name="gender"  id="man" value="0" >남 &emsp; 
	     <input type="radio" name="gender"  id="woman" value="1" >여 </td>
   </tr>
   
   
   <tr>
    <td align="center">이메일</td>
    <td><input type="text" size="8" name="email1"  value="<%=memberDTO.getEmail1() %>"> @
        <input type="email" size="10" name="email2" id="email2" placeholder="직접입력" list="defaultEmails"> 
        <datalist id="defaultEmails">
         <option value="naver.com">
         <option value="daum.net">
         <option value="gmail.com">
        </datalist></td>
    </tr>
    
    <tr>
     <td align="center">핸드폰</td>
     <td>
      <select name="tel1" style="width: 50px" id="tel1">
      <option value="010">010</option>
      <option value="011">011</option>
      <option value="019">019</option> </select> -
      <input type="text" size="5" name="tel2" value="<%=memberDTO.getTel2() %>"> - 
      <input type="text" size="5" name="tel3" value="<%=memberDTO.getTel3() %>">
     </td>  
    </tr>
    
    <tr>
     <td align="center">주소</td>
     <td> <input type="text" size="7" name="zipcode" id="zipcode" value="<%=memberDTO.getZipcode() %>" readonly>
          <input type="button" onclick="checkPost()" value="우편번호검색"><br>
          <input type="text" size="23" name="addr1" id="addr1" placeholder="주소" value="<%=memberDTO.getAddr1() %>"readonly><br>
          <input type="text" size="23" name="addr2" id="addr2" placeholder="상세주소" value="<%=memberDTO.getAddr2() %>"><br>    
     </td>
    </tr>
        
    <tr> 
    <td colspan="2" align="center">
	<input type="button" onclick="checkModifyForm()" value="회원정보수정"> &emsp; 
	<input type="reset" value="다시입력"> </td>
  </tr>

  </table>
 </form>
</body>
<script type="text/javascript" src="../js/member.js"></script>
<script type="text/javascript">
window.onload = function () {
	
	<!-- 성별 라디오 받아오기 -->	
  	if("<%=memberDTO.getGender() %>" == "0"){
		document.getElementById("man").checked = true;
		<!-- document.modifyForm.gender[0].checked = true; -->
   	}else {
   		document.getElementById("woman").checked = true;   
   		<!-- document.modifyForm.gender[1].checked = true; -->
   	}  	
  	<!-- 이메일 받아오기 -->
  	if("<%=memberDTO.getEmail2() %>" != ""){
  		document.getElementById("email2").value = "<%=memberDTO.getEmail2()%>";
  	}
  	<!-- 전화번호 받아오기 -->
	if("<%=memberDTO.getTel1() %>" != ""){
  		document.getElementById("tel1").value = "<%=memberDTO.getTel1()%>";
  	}
}   
</script>
</html>

