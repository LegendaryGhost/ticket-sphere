<%@ page contentType="text/html;charset=UTF-8" %>

<%
    double totalIncome = (double) request.getAttribute("totalIncome");
    double missingIncome = (double) request.getAttribute("missingIncome");
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation dashboard</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <div class="table-container">
            <h1 class="mb-4 text-center">Reservation Dashboard</h1>

            <div class="row justify-content-center mb-4">
                <div class="col-md-6 col-lg-4">
                    <div class="card bg-success text-white">
                        <div class="card-body text-center">
                            <h5 class="card-title">
                                <i class="fas fa-dollar-sign me-2"></i>
                                Total Income
                            </h5>
                            <h2 class="card-text fw-bold">
                                <%= String.format("%.2f", totalIncome) %> €
                            </h2>
                            <p class="card-text">
                                <small class="text-light">Total income from all paid reservations</small>
                            </p>
                        </div>
                    </div>
                </div>

                <div class="col-md-6 col-lg-4">
                    <div class="card bg-danger text-white">
                        <div class="card-body text-center">
                            <h5 class="card-title">
                                <i class="fas fa-dollar-sign me-2"></i>
                                Missing Income
                            </h5>
                            <h2 class="card-text fw-bold">
                                <%= String.format("%.2f", missingIncome) %> €
                            </h2>
                            <p class="card-text">
                                <small class="text-light">Missing income from all cancelled reservations</small>
                            </p>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
