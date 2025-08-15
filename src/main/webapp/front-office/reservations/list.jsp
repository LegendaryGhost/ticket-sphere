<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.utils.DateTimeUtil" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Reservation" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Flight" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Promotion" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <div class="table-container">
            <h1 class="mb-4 text-center">Reservation history</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Departure City</th>
                    <th>Departure Time</th>
                    <th>Arrival City</th>
                    <th>Arrival Time</th>
                    <th>Aircraft</th>
                    <th>Reservation Time</th>
                    <th>Seat Type</th>
                    <th>Adult Count</th>
                    <th>Child Count</th>
                    <th>Promotion</th>
                    <th>Promoted Seats</th>
                    <th>Status</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(Reservation reservation : reservations) {
                        Flight flight = reservation.getFlight();
                        Promotion promotion = reservation.getPromotion();
                %>
                <tr>
                    <td><%= flight.getDepartureCity().getName() + " - " + flight.getDepartureCity().getCountry().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(flight.getDepartureTime()) %></td>
                    <td><%= flight.getArrivalCity().getName() + " - " + flight.getArrivalCity().getCountry().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(flight.getArrivalTime()) %></td>
                    <td><%= flight.getAircraft().getRegistration() + " - " + flight.getAircraft().getAircraftModel().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(reservation.getDateTime()) %></td>
                    <td><%= reservation.getSeatType().getName() %></td>
                    <td><%= reservation.getAdultCount() %></td>
                    <td><%= reservation.getChildCount() %></td>
                    <td><%= (promotion == null ? 0 : promotion.getDiscountPercentage()) + " %"  %></td>
                    <td><%= reservation.getPromotedSeatNumber() %></td>
                    <td>
                        <% if (reservation.getCancellation() == null) { %>
                        <span class="badge bg-success status">Validated</span>
                        <% } else { %>
                        <span class="badge bg-danger status">Cancelled</span>
                        <% } %>
                    </td>
                    <td>
                        <% if (reservation.getCancellation() == null) { %>
                        <a href="${pageContext.request.contextPath}/reservations/cancel?id=<%= reservation.getId() %>"
                           class="btn btn-sm btn-outline-danger">
                            Cancel
                        </a>
                        <% } %>
                    </td>
                </tr>
                <% } %>
                </tbody>
            </table>
        </div>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
