<%@ page import="com.tiarintsoa.ticketsphere.model.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.utils.DateTimeUtil" %>
<%@ page import="com.tiarintsoa.ticketsphere.dto.FlightSearchRequest" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.City" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Aircraft" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Flight> flights = (List<Flight>) request.getAttribute("flights");

    FlightSearchRequest criteria = (FlightSearchRequest) request.getAttribute("criteria");

    @SuppressWarnings("unchecked")
    List<City> cities = (List<City>) request.getAttribute("cities");

    @SuppressWarnings("unchecked")
    List<Aircraft> aircrafts = (List<Aircraft>) request.getAttribute("aircrafts");
%>

<html>
<head>
    <title>Flight list</title>
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Search form</h1>
        <form action="${pageContext.request.contextPath}/admin/flights" method="get">
            <label for="minDepartureTime">Minimum departure time:</label><br>
            <input type="datetime-local" id="minDepartureTime" name="criteria.minDepartureTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMinDepartureTime()) %>"><br>
            <label for="maxDepartureTime">Maximum departure time:</label><br>
            <input type="datetime-local" id="maxDepartureTime" name="criteria.maxDepartureTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMaxDepartureTime()) %>"><br>

            <label for="departureCity">Deparutre city:</label><br>
            <select name="criteria.departureCity" id="departureCity">
                <option value="">All cities</option>
                <% for (City city : cities) { %>
                <option
                        value="<%= city.getId() %>"
                        <% if (city.getId().equals(criteria.getIdDepartureCity())) { %>
                        selected
                        <% } %>
                >
                    <%= city.getName() + " - " + city.getCountry().getName() %>
                </option>
                <% } %>
            </select><br>

            <label for="minArrivalTime">Minimum arrival time:</label><br>
            <input type="datetime-local" id="minArrivalTime" name="criteria.minArrivalTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMinArrivalTime()) %>"><br>
            <label for="maxArrivalTime">Maximum arrival time:</label><br>
            <input type="datetime-local" id="maxArrivalTime" name="criteria.maxArrivalTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMaxArrivalTime()) %>"><br>

            <label for="arrivalCity">Arrival city:</label><br>
            <select name="criteria.arrivalCity" id="arrivalCity">
                <option value="">All cities</option>
                <% for (City city : cities) { %>
                <option
                        value="<%= city.getId() %>"
                        <% if (city.getId().equals(criteria.getIdArrivalCity())) { %>
                        selected
                        <% } %>
                >
                    <%= city.getName() + " - " + city.getCountry().getName() %>
                </option>
                <% } %>
            </select><br>

            <label for="aircraft">Aircraft:</label><br>
            <select name="criteria.aircraft" id="aircraft">
                <option value="">All aircrafts</option>
                <% for (Aircraft aircraft : aircrafts) { %>
                <option
                        value="<%= aircraft.getId() %>"
                        <% if (aircraft.getId().equals(criteria.getIdAircraft())) { %>
                        selected
                        <% } %>
                >
                    <%= aircraft.getRegistration() + " - " + aircraft.getAircraftModel().getName() %>
                </option>
                <% } %>
            </select><br>

            <button type="submit">Search</button>
        </form>

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
