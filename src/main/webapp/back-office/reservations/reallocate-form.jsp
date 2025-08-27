<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reallocate Reservations</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <form class="custom-form row g-3" method="get" action="${pageContext.request.contextPath}/admin/reservations/reallocate">
            <h1 class="text-center">Reallocate Reservation</h1>

            <div class="col-12">
                <label class="form-label" for="reallocationDate">Reallocation Date:</label>
                <input class="form-control" type="date" id="reallocationDate" name="reallocationDate" required>
            </div>

            <div class="col-12">
                <button class="btn btn-primary w-100" type="submit">Reallocate</button>
            </div>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
