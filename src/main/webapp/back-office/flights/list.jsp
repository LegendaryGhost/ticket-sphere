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
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <form class="custom-form row g-3" action="${pageContext.request.contextPath}/admin/flights" method="get">
            <h1 class="text-center">Search form</h1>

            <div class="col-md-6">
                <label class="form-label" for="minDepartureTime">Minimum departure time:</label>
                <input class="form-control" type="datetime-local" id="minDepartureTime" name="criteria.minDepartureTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMinDepartureTime()) %>">
            </div>

            <div class="col-md-6">
                <label class="form-label" for="maxDepartureTime">Maximum departure time:</label>
                <input class="form-control" type="datetime-local" id="maxDepartureTime" name="criteria.maxDepartureTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMaxDepartureTime()) %>">
            </div>

            <div class="col-12">
                <label class="form-label" for="departureCity">Deparutre city:</label>
                <select class="form-select" name="criteria.departureCity" id="departureCity">
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
                </select>
            </div>

            <div class="col-md-6">
                <label class="form-label" for="minArrivalTime">Minimum arrival time:</label>
                <input class="form-control" type="datetime-local" id="minArrivalTime" name="criteria.minArrivalTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMinArrivalTime()) %>">
            </div>

            <div class="col-md-6">
                <label class="form-label" for="maxArrivalTime">Maximum arrival time:</label>
                <input class="form-control" type="datetime-local" id="maxArrivalTime" name="criteria.maxArrivalTime" value="<%= DateTimeUtil.htmlFormat(criteria.getMaxArrivalTime()) %>">
            </div>

            <div class="col-12">
                <label class="form-label" for="arrivalCity">Arrival city:</label>
                <select class="form-select" name="criteria.arrivalCity" id="arrivalCity">
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
                </select>
            </div>

            <div class="col-12">
                <label class="form-label" for="aircraft">Aircraft:</label>
                <select class="form-select" name="criteria.aircraft" id="aircraft">
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
                </select>
            </div>

            <div class="col-12">
                <button class="btn btn-primary w-100" type="submit">Search</button>
            </div>
        </form>

        <div class="table-container">
            <h1 class="mb-4 text-center">Flights</h1>
            <p>
                <a href="${pageContext.request.contextPath}/admin/flights/add"
                    class="btn btn-outline-success">Add a new flight
                </a>
            </p>
            <table class="table table-striped">
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
                            <a href="${pageContext.request.contextPath}/admin/flights/update?id=<%= flight.getId() %>"
                                class="btn btn-sm btn-outline-primary">
                                Update
                            </a>
                            <a href="${pageContext.request.contextPath}/admin/flights/delete?id=<%= flight.getId() %>"
                                class="btn btn-sm btn-outline-danger">
                                Delete
                            </a>
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
