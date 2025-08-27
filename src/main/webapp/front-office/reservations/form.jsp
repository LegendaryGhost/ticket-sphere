<%@ page import="com.tiarintsoa.ticketsphere.model.Flight" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.SeatType" %>
<%@ page import="java.util.List" %>

<%
    @SuppressWarnings("unchecked")
    List<Flight> flights = (List<Flight>) request.getAttribute("flights");

    @SuppressWarnings("unchecked")
    List<SeatType> seatTypes = (List<SeatType>) request.getAttribute("seatTypes");

    Integer idFlight = (Integer) request.getAttribute("idFlight");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make a reservation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <form class="custom-form" action="${pageContext.request.contextPath}/reservations/save" method="post">
            <h1 class="text-center">Make a reservation</h1>
            <div class="mb-3">
                <label class="form-label" for="flight">Flight:</label>
                <select class="form-select" name="reservation.flight" id="flight" required>
                    <option value="">-- Choose a flight --</option>
                    <% for (Flight flight : flights) { %>
                    <option
                        value="<%= flight.getId() %>"
                        <% if (flight.getId().equals(idFlight)) { %>
                            selected
                        <% } %>
                    >
                        <%= flight.getId() + " (" + flight.getDepartureCity().getName() + " - " + flight.getArrivalCity().getName() + ")" %>
                    </option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="seatType">Seat type:</label>
                <select class="form-select" name="reservation.seatType" id="seatType" required>
                    <option value="">-- Choose a seat type --</option>
                    <% for (SeatType seatType : seatTypes) { %>
                    <option value="<%= seatType.getId() %>"><%= seatType.getName() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="adultCount">Adult count:</label>
                <input class="form-control" type="number" min="0" name="reservation.adultCount" id="adultCount" value="1" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="childCount">Child count:</label>
                <input class="form-control" type="number" min="0" name="reservation.childCount" id="childCount" value="0" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="reservationDateTime">Reservation date and time:</label>
                <input class="form-control" type="datetime-local" id="reservationDateTime" name="reservation.reservationDateTime" required>
            </div>

            <div class="mb-3">
                <label class="form-check-label" for="paid">Paid:</label>
                <select class="form-select" name="reservation.paid" id="paid" required>
                    <option value="not-paid" selected>Not paid</option>
                    <option value="paid">Paid</option>
                </select>
            </div>

            <button class="btn btn-primary w-100" type="submit">Reserve</button>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
