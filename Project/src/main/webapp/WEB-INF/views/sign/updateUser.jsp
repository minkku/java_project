<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <title>회원정보 수정</title>
    <!-- 필요한 스타일 시트 등을 여기에 추가하세요. -->
</head>

<body onload="initialize()">
    <script type="text/javascript">
        var regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        var regPw = /^(?=.*[A-Z])(?=.*[0-9!@#$%^&*()-_=+\\|{}\[\]:;<>,.?/]).{5,12}$/;

        function initialize() {
            var email = document.getElementById("email");
            var password = document.getElementById("pw");
            var pwCheck = document.getElementById("pwCheck");
            var user_name = document.getElementById("user_name");
            var address = document.getElementById("address");
            var mobile = document.getElementById("mobile");
            console.log(email, password, pwCheck, user_name, address, mobile);
            document.getElementById("signupForm").onsubmit = function () {
                return validation(email, password, pwCheck, user_name, address, mobile);
            };
        }

        function validation(email, password, pwCheck, user_name, address, mobile) {
            if (email.value === "") {
                document.getElementById("emailErr").innerText = "이메일을 입력하세요";
                email.focus();
                return false;
            } else if (!regEmail.test(email.value)) {
                document.getElementById("emailErr").innerText = "이메일 형식에 맞게 입력해주세요";
                email.focus();
                return false;
            } else {
                document.getElementById("emailErr").innerText = "";
            }

            if (password.value.length === "") {
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

            if (pwCheck.value === "") {
                document.getElementById("pwChErr").innerText = "비밀번호 확인을 입력하세요";
                pwCheck.focus();
                return false;
            } else if (password.value !== pwCheck.value) {
                document.getElementById("pwChErr").innerText = "비밀번호가 일치하지 않습니다";
                pwCheck.focus();
                return false;
            } else {
                document.getElementById("pwChErr").innerText = "";
            }

            if (user_name.value.length === "") {
                document.getElementById("nameErr").innerText = "이름을 입력해 주세요";
                user_name.focus();
                return false;
            } else {
                document.getElementById("nameErr").innerText = "";
            }

            if (address.value === "") {
                document.getElementById("addErr").innerText = "주소를 작성해 주세요";
                address.focus();
                return false;
            } else {
                document.getElementById("addErr").innerText = "";
            }

            if (mobile.value === "") {
                document.getElementById("numErr").innerText = "전화번호를 입력해 주세요";
                mobile.focus();
                return false;
            } else {
                document.getElementById("numErr").innerText = "";
            }

            // 추가: 이메일 중복 체크
            if (checkDuplicate("email")) {
                document.getElementById("emailErr").innerText = "이미 사용 중인 이메일입니다";
                email.focus();
                return false;
            }

            // 추가: 전화번호 중복 체크
            if (checkDuplicate("mobile")) {
                document.getElementById("numErr").innerText = "이미 사용 중인 전화번호입니다";
                mobile.focus();
                return false;
            }

            return true;
        }

        function checkDuplicate(fieldName) {
            var value = document.getElementById(fieldName).value;
            // 여기에 이메일 또는 전화번호 중복 체크를 위한 로직을 추가하세요.
            // 필요에 따라 Ajax 등을 사용하여 서버에 중복 여부를 확인할 수 있습니다.
            // 임시로 false를 반환하도록 처리했습니다.
            return false;
        }
    </script>

    <form id="signupForm" action="/updateUser" method="post">
        <h2>회원정보 수정</h2>
        <div>
            <label for="email">이메일</label>
            <input type="text" id="email" name="email" value="${loginedUser.email}" readonly/>
        </div>

        <div>
            <label for="pw">비밀번호</label>
            <input type="password" id="pw" name="pw" placeholder="영문, 숫자, 특수문자 조합하여 5~12자리 이상 입력해 주세요" value="${users.pw}"/>
            <span id="pwErr" class="error-message"></span>
        </div>

        <div>
            <label for="pwCheck">비밀번호 확인</label>
            <input type="password" id="pwCheck" name="pwCheck" />
            <span id="pwChErr" class="error-message"></span>
        </div>

        <div>
            <label for="user_name">이름</label>
            <input type="text" id="user_name" name="user_name" value="${users.user_name}">
            <span id="nameErr" class="error-message"></span>
        </div>

        <div>
            <label for="address">주소</label>
            <input type="text" id="address" name="address" value="${users.address}"/>
            <span id="addErr" class="error-message"></span>
        </div>

        <div>
            <label for="mobile">전화번호</label>
            <input type="text" id="mobile" name="mobile" value="${users.mobile}"/>
            <span id="numErr" class="error-message"></span>
        </div>

        <div>
            <label for="gender">성별</label>
            <input type="text" id="gender" name="gender" value="${loginedUser.gender}" readonly/>
        </div>

        <div>
            <input type="submit" value="수정하기">
            <span id="error" class="error-message"></span>
        </div>
    </form>
</body>
</html>
