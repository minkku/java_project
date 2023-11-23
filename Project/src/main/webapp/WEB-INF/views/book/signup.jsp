<!-- signup.html -->
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8"/>
    <title>Signup</title>
</head>
<body>
    <h2>Signup</h2>
    <form action="/signup" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required/>
        <br/>
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required/>
        <br/>
        <button type="submit">Signup</button>
    </form>
</body>
</html>
