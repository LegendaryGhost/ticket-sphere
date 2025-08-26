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
    <title>Add a promotion</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <form class="custom-form" action="${pageContext.request.contextPath}/admin/promotions/save" method="post">
            <h1 class="text-center">Add a promotion</h1>

            <div class="mb-3">
                <label class="form-label" for="flight">Flight:</label>
                <select class="form-select" name="promotion.flight" id="flight" required>
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
                <select class="form-select" name="promotion.seatType" id="seatType" required>
                    <option value="">-- Choose a seat type --</option>
                    <% for (SeatType seatType : seatTypes) { %>
                    <option value="<%= seatType.getId() %>"><%= seatType.getName() %></option>
                    <% } %>
                </select>
            </div>

            <div class="mb-3">
                <label class="form-label" for="discountPrice">Discount price:</label>
                <input class="form-control" type="number" min="0.01" step="0.01" name="promotion.discountPrice" id="discountPrice" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="seatCount">Seat count:</label>
                <input class="form-control" type="number" min="1" name="promotion.seatCount" id="seatCount" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="deadline">Deadline:</label>
                <input class="form-control" type="date" name="promotion.deadline" id="deadline" required>
            </div>

            <button class="btn btn-primary w-100" type="submit">Save</button>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
