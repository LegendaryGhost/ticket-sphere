<%@ page import="com.tiarintsoa.ticketsphere.model.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.SeatType" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Flight> flights = (List<Flight>) request.getAttribute("flights");

    @SuppressWarnings("unchecked")
    List<SeatType> seatTypes = (List<SeatType>) request.getAttribute("seatTypes");
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Sphere - Login</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Set flight seat price</h1>
        <form action="${pageContext.request.contextPath}/admin/seat-prices/save" method="post">
            <label for="flight">Flight:</label><br>
            <select name="seatPrice.flight" id="flight" required>
                <option value="">-- Choose a flight --</option>
                <% for (Flight flight : flights) { %>
                <option value="<%= flight.getId() %>">
                    <%= flight.getId() + " (" + flight.getDepartureCity().getName() + " - " + flight.getArrivalCity().getName() + ")" %>
                </option>
                <% } %>
            </select><br>

            <label for="seatType">Seat type:</label><br>
            <select name="seatPrice.seatType" id="seatType" required>
                <option value="">-- Choose a seat type --</option>
                <% for (SeatType seatType : seatTypes) { %>
                <option value="<%= seatType.getId() %>"><%= seatType.getName() %></option>
                <% } %>
            </select><br>

            <label for="price">Price:</label><br>
            <input type="number" min="0.01" step="0.01" name="seatPrice.price" id="price" required><br>

            <button type="submit">Save</button>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
