<%@ page import="java.util.List" %>
<%@ page import="com.tiarintsoa.ticketsphere.model.Configuration" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    @SuppressWarnings("unchecked")
    List<Configuration> configurations = (List<Configuration>) request.getAttribute("configurations");
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Configurations list</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Configurations list</h1>
        <table>
            <thead>
                <tr>
                    <th>Key</th>
                    <th>Value</th>
                    <th>Description</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% for(Configuration configuration : configurations) { %>
                <tr>
                    <td><%= configuration.getDisplayName() %></td>
                    <td><%= configuration.getValue() %></td>
                    <td><%= configuration.getDescription() %></td>
                    <td>
                        <a href="${pageContext.request.contextPath}/admin/configurations/update?key=<%= configuration.getKey() %>">Update</a>
                    </td>
                </tr>
                <% } %>
            </tbody>
        </table>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
