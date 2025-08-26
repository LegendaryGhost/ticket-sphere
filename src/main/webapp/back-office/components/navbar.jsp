<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Ticket Sphere - BO</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/reservations/dashboard">Dashboard</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/flights">Flights</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/seat-prices/form">Set seat </a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/promotions">Promotions</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/promotions/form">Add a promotion</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/reservations">Reservations</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/reservations/reallocate/form">Reallocate</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin/configurations">Configurations</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/admin-auth/logout">Logout</a>
            </div>
        </div>
    </div>
</nav>