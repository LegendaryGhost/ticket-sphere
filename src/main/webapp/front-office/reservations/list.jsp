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
    <style>
        body {
            background-color: #f4f6f8;
        }
        .table-container {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            padding: 20px;
            margin-top: 20px;
        }
        .table-responsive {
            max-height: 600px;
            overflow-y: auto;
        }
        .table th {
            background-color: #f8f9fa;
            position: sticky;
            top: 0;
            z-index: 10;
        }
        .status {
            font-weight: bold;
        }
    </style>
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <div class="row">
            <div class="col-12">
                <div class="table-container">
                    <h1 class="mb-4">Reservation history</h1>
                    <div class="table-responsive">
                        <table class="table table-striped table-hover">
                            <thead>
                            <tr>
                                <th>Departure City</th>
                                <th>Departure Time</th>
                                <th>Arrival City</th>
                                <th>Arrival Time</th>
                                <th>Aircraft</th>
                                <th>Reservation Time</th>
                                <th>Seat Type</th>
                                <th>Seat Count</th>
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
                </div>
            </div>
        </div>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
