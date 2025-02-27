<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.City" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Aircraft" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Flight" %>
<%@ page import="com.tiarintsoa.ticketsphere.utils.DateTimeUtil" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Flight flight = (Flight) request.getAttribute("flight");
    String title = (String) request.getAttribute("title");
    String submitButtonText = (String) request.getAttribute("submitButtonText");

    @SuppressWarnings("unchecked")
    List<City> cities = (List<City>) request.getAttribute("cities");

    @SuppressWarnings("unchecked")
    List<Aircraft> aircrafts = (List<Aircraft>) request.getAttribute("aircrafts");
%>

<html>
<head>
    <title><%= title %></title>
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1><%= title %></h1>
        <form method="post" action="${pageContext.request.contextPath}/admin/flights/save">
            <input type="hidden" name="flight.id" value="<%= flight.getId() %>">

            <label for="departureTime">Departure time:</label><br>
            <input type="datetime-local" id="departureTime" name="flight.departureTime" value="<%= DateTimeUtil.htmlFormat(flight.getDepartureTime()) %>" required><br>

            <label for="departureCity">Deparutre city:</label><br>
            <select name="flight.departureCity" id="departureCity" required>
                <option value="">-- Choose a city --</option>
                <% for (City city : cities) { %>
                <option
                        value="<%= city.getId() %>"
                        <% if (flight.getDepartureCity() != null && city.getId().equals(flight.getDepartureCity().getId())) { %>
                        selected
                        <% } %>
                >
                    <%= city.getName() + " - " + city.getCountry().getName() %>
                </option>
                <% } %>
            </select><br>

            <label for="arrivalTime">Arrival time:</label><br>
            <input type="datetime-local" id="arrivalTime" name="flight.arrivalTime" value="<%= DateTimeUtil.htmlFormat(flight.getArrivalTime()) %>" required><br>

            <label for="arrivalCity">Arrival city:</label><br>
            <select name="flight.arrivalCity" id="arrivalCity" required>
                <option value="">-- Choose a city --</option>
                <% for (City city : cities) { %>
                <option
                        value="<%= city.getId() %>"
                        <% if (flight.getArrivalCity() != null && city.getId().equals(flight.getArrivalCity().getId())) { %>
                        selected
                        <% } %>
                >
                    <%= city.getName() + " - " + city.getCountry().getName() %>
                </option>
                <% } %>
            </select><br>

            <label for="aircraft">Aircraft:</label><br>
            <select name="flight.aircraft" id="aircraft" required>
                <option value="">-- Choose an aircraft --</option>
                <% for (Aircraft aircraft : aircrafts) { %>
                <option
                        value="<%= aircraft.getId() %>"
                        <% if (flight.getAircraft() != null && aircraft.getId().equals(flight.getAircraft().getId())) { %>
                        selected
                        <% } %>
                >
                    <%= aircraft.getRegistration() + " - " + aircraft.getAircraftModel().getName() %>
                </option>
                <% } %>
            </select><br>

            <button type="submit"><%= submitButtonText %></button>
        </form>
    </main>
</body>
</html>
