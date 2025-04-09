<%@ page contentType="text/html;charset=UTF-8" %>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Sphere - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/login.css">
</head>
<body>
<main class="container">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-6 d-flex justify-content-center">
            <div class="login-container">
                <h1 class="login-header">Ticket Sphere Login</h1>
                <form action="${pageContext.request.contextPath}/login" method="post">
                    <div class="form-group">
                        <label for="email" class="form-label">Email</label>
                        <input type="email"
                               class="form-control"
                               name="credentials.email"
                               id="email"
                               placeholder="Enter your email"
                               required>
                    </div>
                    <div class="form-group">
                        <label for="password" class="form-label">Password</label>
                        <input type="password"
                               class="form-control"
                               name="credentials.password"
                               id="password"
                               placeholder="Enter your password"
                               required>
                    </div>
                    <button type="submit" class="btn btn-primary btn-login mt-3">
                        Login
                    </button>
                </form>
            </div>
        </div>
    </div>
</main>

<script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>