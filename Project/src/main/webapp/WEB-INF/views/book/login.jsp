<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ include file= "../includes/header.jsp" %>
<body>

<form action = "/login" method = "post" name = "frm">
	<table align = "center">
		<tr>
			<td colspan = "2">로그인</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type = "text" name = "user_id" size = "10"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type = "password" name = "pw" size = "10"></td>
		</tr>
		
		<tr>
			<td colspan = "2">
				<input type = "submit" value = "로그인" onclick = "return loginCheck()">
				<input type = "reset" value = "취소">
			</td>
		</tr>
	</table>
	<div style="color:red; text-align: center;"> ${message} </div>
</form>
</body>
</html>