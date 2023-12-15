<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>회원정보 수정</title>
	<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
	<link rel="stylesheet" href="../../../resources/sign/updateUser.css">
</head>

<body onload="initialize()">
    <script type="text/javascript">
	var regPw = /^(?=.*[A-Z])(?=.*[0-9!@ $%^&*()-_=+\\|{}\[\]:;<>,.?/]).{5,12}$/;

	function initialize() {
		var password = document.getElementById("pw");
		// name은 이미 브라우저에서 제공하는 전역 개체 window 속성중 하나여서 매개 변수 사용시 오류 발생하니 바꿔주자
		console.log(password);
		document.getElementById("updateForm").onsubmit = function () {
			return validation(password);
		};
	}

	function validation(password) {
		console.log("되는거 맞아?");
		if (password.value.length <= 0) {
			document.getElementById("pwErr").innerText = "비밀번호를 입력하세요";
			password.focus();
			return false;
		} else if (!regPw.test(password.value)) {
			document.getElementById("pwErr").innerText = "비밀번호 형식에 맞게 입력해주세요";
			password.focus();
			return false;
		} else {
			document.getElementById("pwErr").innerText = "";
		}

		return true;
	}
    </script>

    <form id="updateForm" action="/updateUser" method="post" onload="initialize()">
	    <h2>회원정보 수정</h2>
	
	    <div class="info_email divider">
	        <input type="text" id="email" name="email" value="${user.email}" readonly class="disabled-input"/>
	        <label for="email" class="u-email">이메일</label>
	        <span id="emailErr" class="error-message"></span>
	    </div>
	
	    <div class="info_name divider">
	        <label for="pw">비밀번호</label>
	        <input type="password" id="pw" name="pw" placeholder="영문, 숫자, 특수문자 조합하여 5~12자리 이상 입력해 주세요" class="disabled-input"/>
	        <span id="pwErr" class="error-message"></span>
	    </div>
	
	    <div class="info_name divider">
	        <label for="user_name">이름</label>
	        <input type="text" id="user_name" name="user_name" value="${user.user_name}" class="disabled-input" />
	        <span id="nameErr" class="error-message"></span>
	    </div>
	
	    <div class="info_address divider">
	        <label for="address">주소</label>
	        <input type="text" id="address" name="address" value="${user.address}" class="disabled-input" />
	        <span id="addErr" class="error-message"></span>
	    </div>
	
	    <div class="info_mobile divider">
	        <label for="mobile">전화번호</label>
	        <input type="text" id="mobile" name="mobile" value="${user.mobile}" class="disabled-input" />
	        <span id="numErr" class="error-message"></span>
	    </div>
	
	    <div class="info_name divider">
	        <label for="gender">성별</label>
	        <input type="text" id="gender" name="gender" value="${user.gender}" readonly class="disabled-input" />
	    </div>
	
	    <div class="link-to-update divider" onclick="location.href='/updateUser'">
	        <span>회원정보 수정</span>
	        <a href="/updateUser" class="update-link">
	            <i class="fa-regular fa-greater-than"  style="font-size:12px;"></i>
	        </a>
	    </div>
	</form>

</body>
<script type="text/javascript">
$(document).ready(function () {
    // Your existing code here

    // Show update message using jQuery
    function showUpdateMessage(success) {
        var messageElement = $("#updateMessage");

        if (success) {
            messageElement.text("회원 정보가 성공적으로 업데이트되었습니다.");
        } else {
            messageElement.text("회원 정보 업데이트에 실패하였습니다.");
        }
        // Show the message using jQuery UI or your custom styling
        messageElement.show().fadeOut(5000);
    }
    // Call the function with the update success status
    showUpdateMessage(${updateSuccess});
});

</script>
</html>
