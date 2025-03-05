<%@ page import="com.tiarintsoa.ticketsphere.model.Configuration" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Configuration configuration = (Configuration) request.getAttribute("configuration");
%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update configuration</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap/css/bootstrap.min.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main>
        <h1>Update configuration</h1>
        <form method="post" action="${pageContext.request.contextPath}/admin/configurations/save">
            <input type="hidden" name="configuration.key" value="<%= configuration.getKey() %>">

            <label for="displayName">Display name:</label><br>
            <input type="text" id="displayName" name="configuration.displayName" value="<%= configuration.getDisplayName() %>" required><br>

            <label for="value">Value:</label><br>
            <input type="text" id="value" name="configuration.value" value="<%= configuration.getValue() %>" required><br>

            <label for="description">Description:</label><br>
            <input type="text" id="description" name="configuration.description" value="<%= configuration.getDescription() %>" required><br>

            <button type="submit">Update</button>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
