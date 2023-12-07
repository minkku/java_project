<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ㅅㅏㄹㅏ</title>
<link rel="stylesheet" href="../../../resources/sign/sign.css">
</head>
<body onload="initialize()">
	<script type="text/javascript">
		var regEmail = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;

		function initialize() {
			var email = document.getElementById("email");
			var password = document.getElementById("pw");
			console.log(email, password);
			if (email && password) {
				document.getElementById("signinForm").onsubmit = function() {
					return validation(email, password);
				}
			}
		}

		function validation(email, password) {
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
			return true;
		}
	</script>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<div class="card">
					<div class="card-header">
						<h3>로그인</h3>
					</div>
					<div class="card-body">
						<!-- Your login form -->
						<form id="signinForm" action="/signin" method="post">

							<div class="form-group">
								<label for="email">이메일</label>
								<input type="text" class="form-control" id="email" name="email" value="${uVo.email}">${uVo.email}
								<span id="emailErr"class="error-message"></span>
							</div>

							<div class="form-group">
								<label for="pw">비밀번호</label> 
								<input type="password" class="form-control" id="pw" name="pw" value="${uVo.pw}">${uVo.pw} 
								<span id="pwErr" class="error-message"></span>
							</div>

							<button type="submit" class="btn btn-primary">로그인</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
