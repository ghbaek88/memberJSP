<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>우편 번호</title>
</head>
<body>
 <form name="chekPost" method="post" action="">
  <table border="1" cellspacing="0" cellpadding="3" align="center">
  <style type="text/css">
   th {font-size:8pt; background-color: #ffff00}  
  </style>  
   <tr>
    <th width="100">시도</th>
    <td>
     <select name="sido" style="width: 100px" >시도선택
     <option>직접 입력</option>
     <option value="서울">서울</option>
     <option value="인천">인천</option>
     <option value="대전">대전</option>
     <option value="대구">대구</option>
     <option value="울산">울산</option>
     <option value="세종">세종</option>
     <option value="광주">광주</option>
     <option value="경기">경기</option>
     <option value="강원">강원</option>
     <option value="전남">전남</option>
     <option value="전북">전북</option>
     <option value="경남">경남</option>
     <option value="경북">경북</option>
     <option value="충남">충남</option>
     <option value="충북">충북</option>
     <option value="부산">부산</option>
     <option value="제주">제주</option> </select> </td>
    <th width="100">시.군.구</th>
    <td><input type="text" size="30" name="sigungu"></td>
   </tr>
   
   <tr>
    <th>도로명</th>
    <td colspan="3">
    <input type="text" size="45" name="roadname">
    <input type="submit" value="검색"> </td>
   </tr>
   
   <tr>
    <th>우편번호</th>
    <th colspan="3">주소</th>    
   </tr>   
   
  </table>
 </form>
</body>
</html>