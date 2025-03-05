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

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Make a reservation</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Make a reservation</h1>
        <form action="${pageContext.request.contextPath}/reservations/save" method="post">
            <label for="flight">Flight:</label><br>
            <select name="reservation.flight" id="flight" required>
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
            </select><br>

            <label for="seatType">Seat type:</label><br>
            <select name="reservation.seatType" id="seatType" required>
                <option value="">-- Choose a seat type --</option>
                <% for (SeatType seatType : seatTypes) { %>
                <option value="<%= seatType.getId() %>"><%= seatType.getName() %></option>
                <% } %>
            </select><br>

            <label for="seatNumber">Seat number:</label><br>
            <input type="number" min="1" name="reservation.seatNumber" id="seatNumber" required><br>

            <button type="submit">Reserve</button>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
