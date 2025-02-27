<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.City" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Aircraft" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<City> cities = (List<City>) request.getAttribute("cities");

    @SuppressWarnings("unchecked")
    List<Aircraft> aircrafts = (List<Aircraft>) request.getAttribute("aircrafts");
%>

<html>
<head>
    <title>Add a new flight</title>
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Add a new flight</h1>
        <form method="post" action="${pageContext.request.contextPath}/admin/flights/save">
            <label for="departureTime">Departure time:</label><br>
            <input type="datetime-local" id="departureTime" name="flight.departureTime" required><br>

            <label for="departureCity">Deparutre city:</label><br>
            <select name="flight.departureCity" id="departureCity" required>
                <option value="">-- Choose a city --</option>
                <% for (City city : cities) { %>
                <option value="<%= city.getId() %>"><%= city.getName() + " - " + city.getCountry().getName() %></option>
                <% } %>
            </select><br>

            <label for="arrivalTime">Arrival time:</label><br>
            <input type="datetime-local" id="arrivalTime" name="flight.arrivalTime" required><br>

            <label for="arrivalCity">Arrival city:</label><br>
            <select name="flight.arrivalCity" id="arrivalCity" required>
                <option value="">-- Choose a city --</option>
                <% for (City city : cities) { %>
                <option value="<%= city.getId() %>"><%= city.getName() + " - " + city.getCountry().getName() %></option>
                <% } %>
            </select><br>

            <label for="aircraft">Aircraft:</label><br>
            <select name="flight.aircraft" id="aircraft" required>
                <option value="">-- Choose an aircraft --</option>
                <% for (Aircraft aircraft : aircrafts) { %>
                <option value="<%= aircraft.getId() %>"><%= aircraft.getRegistration() + " - " + aircraft.getAircraftModel().getName() %></option>
                <% } %>
            </select><br>

            <button type="submit">Add</button>
        </form>
    </main>
</body>
</html>
