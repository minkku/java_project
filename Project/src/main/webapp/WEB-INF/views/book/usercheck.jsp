<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table align="center" width="550" method="post" action="/login">
		<tr>
			<td id="front">아이디</td>
			<td>${loginUser.users_id}</td>
		</tr>
		<tr>
			<td id="front">비밀번호</td>
			<td><input type="password" name="pwd" required></td>
		</tr>
		<tr align="center">
			<td colspan="2">
				<input type="submit" value="수정">
				<input type="reset" value="취소">
			</td>
		</tr>
	</table>
</body>
</html>