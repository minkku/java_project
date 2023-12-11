<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ㅅㅏㄹㅏ</title>
    <link rel="stylesheet" href="../../../resources/sign/sign.css">
</head>
<body>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card">
                <div class="card-header">
                    <h3>Login</h3>
                </div>
                <div class="card-body">
                    <!-- Your login form -->
                    <form action="/signin" method="post">
                       
                        <div class="form-group">
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" name="email" value="${users.email}">${users.email}
                            <span id="emailErr" class="error-message"></span>
                        </div>
                        
                        <div class="form-group">
                            <label for="password">비밀번호</label>
                            <input type="password" class="form-control" id="pw" name="pw" value="${users.pw}">${users.pw}
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
