<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Form</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data"
		action="fileUpload.jsp">
		<table border="1" cellspacing="0" cellpadding="3">
			<!-- 제목 만들기 -->
			<tr>
				<td width="100" align="center">제목</td>
				<td><input type="text" size="30" name="subject" id="subject"
					placeholder="제목 입력"></td>
			</tr>

			<!-- 내용 만들기 -->
			<tr>
				<td width="100" align="center">내용</td>
				<td><textarea name="content" id="content" rows="15" cols="50"
						style="resize: none;" placeholder="내용을 입력"></textarea></td>
			</tr>

			<!-- 파일업로드1 만들기 -->
			<tr>
				<td colspan="2"><input type="file" name="upload1" size="15"></td>
			</tr>

			<!-- 파일업로드2 만들기 -->
			<tr>
				<td colspan="2"><input type="file" name="upload2" size="15"></td>
			</tr>
			
			<tr>
				<td colspan="2" align="center"><input type="submit" value="파일업로드"></td>
			</tr>
		</table>
	</form>
</body>
</html>