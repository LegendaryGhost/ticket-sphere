<%@ page import="com.tiarintsoa.ticketsphere.model.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.utils.DateTimeUtil" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Flight> flights = (List<Flight>) request.getAttribute("flights");
%>

<html>
<head>
    <title>Flight list</title>
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Flights</h1>
        <p>
            <a href="${pageContext.request.contextPath}/admin/flights/add">Add a new flight</a>
        </p>
        <table>
            <thead>
                <tr>
                    <th>Flight number</th>
                    <th>Departure city</th>
                    <th>Departure time</th>
                    <th>Arrival city</th>
                    <th>Arrival time</th>
                    <th>Aircraft</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for(Flight flight : flights) { %>
                <tr>
                    <td><%= flight.getId() %></td>
                    <td><%= flight.getDepartureCity().getName() + " " + flight.getDepartureCity().getCountry().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(flight.getDepartureTime()) %></td>
                    <td><%= flight.getArrivalCity().getName() + " " + flight.getArrivalCity().getCountry().getName() %></td>
                    <td><%= DateTimeUtil.humanFormat(flight.getArrivalTime()) %></td>
                    <td><%= flight.getAircraft().getRegistration() + " - " + flight.getAircraft().getAircraftModel().getName() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/flights/update?id=<%= flight.getId() %>">Update</a>
                        <a href="${pageContext.request.contextPath}/admin/flights/delete?id=<%= flight.getId() %>">Delete</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </main>
</body>
</html>
