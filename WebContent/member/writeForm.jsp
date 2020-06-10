<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
 boolean checkValue = false;
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
  <style type="text/css">
   td {background:dodgerblue}  
  </style>  
</head>
<body>
<h3 align="center">회원가입</h3>
 <form name="writeForm" method="post" action="write.jsp">
  <table border="1" cellspacing="0" cellpadding="3" align="center">

   <tr>
    <td width="100" align="center"><font color="red"> * </font> 이름 </td>
    <td><input type="text" size="15" name="name" id="name" placeholder="이름입력"></td>
   </tr>
  
   <tr>
    <td align="center"><font color="red"> * </font> 아이디 </td>
    <td><input type="text" size="15" name="id" placeholder="아이디 입력" onkeypress="overlapCheck();">
   		<input type="button" value="중복체크" onclick="checkId()"></td>
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
	<td> <input type="radio" name="gender" value="0" checked>남 &emsp; 
	     <input type="radio" name="gender" value="1">여 </td>
   </tr>
   
   <tr>
    <td align="center">이메일</td>
    <td><input type="text" size="8" name="email1" > @
        <input type="email" size="10" name="email2" placeholder="직접입력" list="defaultEmails"> 
        <datalist id="defaultEmails">
         <option value="naver.com">
         <option value="daum.net">
         <option value="gmail.com">
        </datalist></td>
    </tr>
    
    <tr>
     <td align="center">핸드폰</td>
     <td>
      <select name="tel1" style="width: 50px">
      <option value="010">010</option>
      <option value="011">011</option>
      <option value="019">019</option> </select> -
      <input type="text" size="5" name="tel2" > - 
      <input type="text" size="5" name="tel3" >
     </td>  
    </tr>
    
    <tr>
     <td align="center">주소</td>
     <td> <input type="text" size="7" name="zipcode" id="zipcode" readonly>
          <input type="button" onclick="checkPost()" value="우편번호검색"><br>
          <input type="text" size="23" name="addr1" id="addr1" placeholder="주소" readonly><br>
          <input type="text" size="23" name="addr2" id="addr2" placeholder="상세주소"><br>    
     </td>
    </tr>
        
    <tr> 
    <td colspan="2" align="center">
	<input type="button" onclick="checkWriteForm()" value="회원가입"> &emsp; 
	<input type="reset" value="다시입력"> </td>
  </tr>
  
  </table>
 </form>
</body>
<script type="text/javascript" src="../js/member.js"></script> 
</html>