<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.utils.DateTimeUtil" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Reservation" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Flight" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Promotion" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Client" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Reservation> reservations = (List<Reservation>) request.getAttribute("reservations");
%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Reservation list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <div class="table-container">
            <h1 class="mb-4 text-center">Reservations</h1>
            <table class="table table-striped">
                <thead>
                <tr>
                    <th>Flight number</th>
                    <th>Client</th>
                    <th>Reservation Date</th>
                    <th>Seat Type</th>
                    <th>Adult Count</th>
                    <th>Child Count</th>
                    <th>Discount price</th>
                    <th>Promoted Seats</th>
                    <th>Paid</th>
                    <th>Status</th>
                    <th>Cancellation Date</th>
                </tr>
                </thead>
                <tbody>
                <%
                    for(Reservation reservation : reservations) {
                        Flight flight = reservation.getFlight();
                        Client client = reservation.getClient();
                        Promotion promotion = reservation.getPromotion();
                %>
                <tr>
                    <td><%= flight.getId() %></td>
                    <td><%= client.getFirstName() + " " + client.getLastName() %></td>
                    <td><%= DateTimeUtil.humanFormat(reservation.getReservationDateTime()) %></td>
                    <td><%= reservation.getSeatType().getName() %></td>
                    <td><%= reservation.getAdultCount() %></td>
                    <td><%= reservation.getChildCount() %></td>
                    <td><%= (promotion == null ? 0 : promotion.getDiscountPrice()) %> €</td>
                    <td><%= reservation.getPromotedSeatNumber() %></td>
                    <td>
                        <% if (reservation.getPaid()) { %>
                        <span class="badge bg-success status">Paid</span>
                        <% } else { %>
                        <span class="badge bg-danger status">Not paid</span>
                        <% } %>
                    </td><td>
                        <% if (reservation.getCancellationDateTime() == null) { %>
                        <span class="badge bg-success status">Validated</span>
                        <% } else { %>
                        <span class="badge bg-danger status">Cancelled</span>
                        <% } %>
                    </td>
                    <td>
                        <% if (reservation.getCancellationDateTime() != null) { %>
                        <%= DateTimeUtil.humanFormat(reservation.getCancellationDateTime()) %>
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
