<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ㅅㅏㄹㅏ</title>
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
                    <form action="login.jsp" method="get">
                    	 <div class="form-group">
                            <label for="username">이름 :</label>
                            <input type="text" class="form-control" id="username" name="username" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="userId">이메일 :</label>
                            <input type="text" class="form-control" id="email" name="userEamil" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="password">비밀번호 :</label>
                            <input type="password" class="form-control" id="pw" name="pw" required>
                        </div>
                        
                         <div class="form-group">
                            <label for="checkpw">비밀번호 확인 :</label>
                            <input type="password" class="form-control" id="pwCheck" name="pwCh" required>
                        </div>
                        
                        <div class="form-group">
                            <label for="address">주소 :</label>
                            <input type="text" class="form-control" id="password" name="password" required>
                        </div>
                        
                        <button type="submit" class="btn btn-primary">Login</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
