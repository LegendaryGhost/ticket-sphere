<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>FO - Login</title>
</head>
<body>
    <h1>Front Office Login</h1>
    <form action="${pageContext.request.contextPath}/login" method="post">
        <label for="email">Email :</label><br>
        <input type="email" name="credentials.email" id="email" /><br>
        <label for="password">Password :</label><br>
        <input type="password" name="credentials.password" id="password" /><br>
        <button type="submit">Login</button>
    </form>
</body>
</html>
