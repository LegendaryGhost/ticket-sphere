<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.utils.DateTimeUtil" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Promotion" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Promotion> promotions = (List<Promotion>) request.getAttribute("promotions");
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Promotion list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <div class="table-container">
            <h1 class="mb-4 text-center">Promotions</h1>
            <p>
                <a href="${pageContext.request.contextPath}/admin/promotions/add"
                    class="btn btn-outline-success">Add a new promotion
                </a>
            </p>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th>Flight number</th>
                        <th>Seat type</th>
                        <th>Seat count</th>
                        <th>Discount price</th>
                        <th>Deadline</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <% for(Promotion promotion : promotions) { %>
                    <tr>
                        <td><%= promotion.getFlight().getId() %></td>
                        <td><%= promotion.getSeatType().getName() %></td>
                        <td><%= promotion.getSeatCount() %></td>
                        <td><%= promotion.getDiscountPrice() %> USD</td>
                        <td><%= DateTimeUtil.humanFormat(promotion.getDeadline()) %></td>
                        <td>
                            <a href="${pageContext.request.contextPath}/admin/promotions/delete?id=<%= promotion.getId() %>"
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
