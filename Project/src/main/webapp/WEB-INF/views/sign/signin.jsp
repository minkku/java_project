<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>ㅅㅏㄹㅏ</title>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="../../../resources/sign/sign.css">
</head>
<body>
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
								<input type="text" class="form-control" id="email" name="email" value="${signin.email}">${signin.email}
							</div>

							<div class="form-group">
								<label for="pw">비밀번호</label> 
								<input type="password" class="form-control" id="pw" name="pw" value="${signin.pw}">${signin.pw} 
							</div>
							
							<div class="form-group">
								<label for="signup">아이디가 없으시면 회원가입 해주세요</label>
							</div>

							<button id="signin" type="submit" class="btn btn-primary">로그인</button>
							<button id="signup2" type="button" class="btn btn-primary" onclick="location.href='/signup'">회원가입</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

<script type="text/javascript">
	$(document).ready(function() {
		if(${result} != 1){
			alert("아이디 또는 비밀번호가 일치하지 않습네다");
			return false;
		}
	});
</script>

<script type="text/javascript">
	$(document).ready(function(e){
		$('#signin').on("click",function(){

			// 입력 값 체크
			if($.trim($('#email').val()) == ''){
				alert("아이디를 입력해 주세요.");
				$('#email').focus();
				return false;
			} else if($.trim($('#pw').val()) == ''){
				alert("패스워드를 입력해 주세요.");
				$('#pw').focus();
				return false;
			}
			//전송
			$('#signinForm').submit();
		});
		return true;
	});
</script>
</html>
