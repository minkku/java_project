<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8" />
<title>ㅅㅏㄹㅏ</title>
</head>
<body>
	<h2>ㅅㅏㄹㅏ</h2>
	<form action="/signup" method="post">
		<div>
			<label for="users_id">이메일</label>
			<input type="text" id="username" name="username" required />
		</div>

		<div>
			<label for="password">비밀번호</label>
			<input type="password" id="pw" name="password" required />
		</div>
		
		<div>
			<label for="password">비밀번호 확인</label> 
			<input type="password" id="pwCheck" name="password" required />
		</div>
		
		<div>
			<label for="password">비밀번호</label>
			<input type="password" id="pw" name="password" required />
		</div>
		
		<div>
			<label for="password">비밀번호</label>
			<input type="password" id="pw" name="password" required />
		</div>
		
		<div>
			<button type="submit">가입하기</button>
		</div>
	</form>
</body>
</html>
