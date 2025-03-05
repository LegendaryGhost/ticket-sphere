<nav class="navbar navbar-expand-lg bg-body-tertiary">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Ticket Sphere</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNavAltMarkup"
                aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-link" href="${pageContext.request.contextPath}/flights">Flights</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/reservations">Reservation history</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/reservations/create">Make a reservation</a>
                <a class="nav-link" href="${pageContext.request.contextPath}/logout">Logout</a>
            </div>
        </div>
    </div>
</nav>