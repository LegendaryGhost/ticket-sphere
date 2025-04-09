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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%= title %></title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <form class="custom-form row g-3" method="post" action="${pageContext.request.contextPath}/admin/flights/save">
            <h1 class="text-center"><%= title %></h1>
            <input type="hidden" name="flight.id" value="<%= flight.getId() %>">

            <div class="col-md-6">
                <label class="form-label" for="departureTime">Departure time:</label>
                <input class="form-control" type="datetime-local" id="departureTime" name="flight.departureTime" value="<%= DateTimeUtil.htmlFormat(flight.getDepartureTime()) %>" required>
            </div>

            <div class="col-md-6">
                <label class="form-label" for="departureCity">Deparutre city:</label>
                <select class="form-select" name="flight.departureCity" id="departureCity" required>
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
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label" for="arrivalTime">Arrival time:</label>
                <input class="form-control" type="datetime-local" id="arrivalTime" name="flight.arrivalTime" value="<%= DateTimeUtil.htmlFormat(flight.getArrivalTime()) %>" required>
            </div>

            <div class="col-md-6">
                <label class="form-label" for="arrivalCity">Arrival city:</label>
                <select class="form-select" name="flight.arrivalCity" id="arrivalCity" required>
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
                </select>
            </div>

            <div class="col-12">
                <label class="form-label" for="aircraft">Aircraft:</label>
                <select class="form-select" name="flight.aircraft" id="aircraft" required>
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
                </select>
            </div>

            <div class="col-12">
                <button class="btn btn-primary w-100" type="submit"><%= submitButtonText %></button>
            </div>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
