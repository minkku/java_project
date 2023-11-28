<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>ㅅㅏㄹㅏ</title>
    <link rel="stylesheet" href="../../../resources/sign/sign.css">
</head>
<body>
    <h2>회원가입</h2>
    <form action="/signup" method="post">
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" placeholder="example@xxx.com" required />
        	<span id="emailErr" class="error-message"></span>
        </div>

        <div>
            <label for="password">비밀번호</label>
            <input type="password" id="password" name="password" placeholder="영문, 숫자, 특수문자 조합하여 8~16자" required />
        	<span id="pwErr" class="error-message"></span>
        </div>
        
        <div>
            <label for="pwCheck">비밀번호 확인</label> 
            <input type="password" id="pwCheck" name="pwCheck" required />
        	<span id="pwChErr" class="error-message"></span>
        </div>
        
        <div>
            <label for="name">이름</label>
            <input type="text" id="name" name="name" required />
        </div>
        
        <div>
            <label for="address">주소</label>
            <input type="text" id="address" name="address" required />
        </div>
        
        <div>
            <label for="gender">성별</label>
            <input type="text" id="gender" name="gender" required />
        </div>
        
        <div>
            <button type="submit">가입하기</button>
        </div>
    </form>
</body>
</html>
