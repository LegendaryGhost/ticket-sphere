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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <form class="custom-form" action="${pageContext.request.contextPath}/admin/seat-prices/save" method="post">
            <h1 class="text-center">Set flight seat price</h1>
            <div class="mb-3">
                <label class="form-label" for="flight">Flight:</label>
                <select class="form-select" name="seatPrice.flight" id="flight" required>
                    <option value="">-- Choose a flight --</option>
                    <% for (Flight flight : flights) { %>
                    <option value="<%= flight.getId() %>">
                        <%= flight.getId() + " (" + flight.getDepartureCity().getName() + " - " + flight.getArrivalCity().getName() + ")" %>
                    </option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="seatType">Seat type:</label>
                <select class="form-select" name="seatPrice.seatType" id="seatType" required>
                    <option value="">-- Choose a seat type --</option>
                    <% for (SeatType seatType : seatTypes) { %>
                    <option value="<%= seatType.getId() %>"><%= seatType.getName() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="price">Price:</label>
                <input class="form-control" type="number" min="0.01" step="0.01" name="seatPrice.price" id="price" required>
            </div>

            <button class="btn btn-primary w-100" type="submit">Save</button>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
