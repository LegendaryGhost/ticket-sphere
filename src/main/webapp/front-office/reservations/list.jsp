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

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Reservation history</h1>
        <table>
            <thead>
                <tr>
                    <th>Departure city</th>
                    <th>Departure time</th>
                    <th>Arrival city</th>
                    <th>Arrival time</th>
                    <th>Aircraft</th>
                    <th>Reservation time</th>
                    <th>Seat type</th>
                    <th>Seat count</th>
                    <th>Promotion</th>
                    <th>Promoted seat count</th>
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
                    <td><%= flight.getDepartureCity().getName() + " " + flight.getDepartureCity().getCountry().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(flight.getDepartureTime()) %></td>
                    <td><%= flight.getArrivalCity().getName() + " " + flight.getArrivalCity().getCountry().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(flight.getArrivalTime()) %></td>
                    <td><%= flight.getAircraft().getRegistration() + " - " + flight.getAircraft().getAircraftModel().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(reservation.getDateTime()) %></td>
                    <td><%= reservation.getSeatType().getName() %></td>
                    <td><%= reservation.getSeatNumber() %></td>
                    <td><%= (promotion == null ? 0 : promotion.getDiscountPercentage()) + " %"  %></td>
                    <td><%= reservation.getPromotedSeatNumber() %></td>
                    <td><%= reservation.getCancellation() == null ? "Validated" : "Cancelled" %></td>
                    <td>
                        <% if (reservation.getCancellation() == null) { %>
                        <a href="${pageContext.request.contextPath}/reservations/cancel?id=<%= reservation.getId() %>">Cancel</a>
                        <% } %>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
