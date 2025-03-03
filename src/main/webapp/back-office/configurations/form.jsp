<%@ page import="com.tiarintsoa.ticketsphere.model.Configuration" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Configuration configuration = (Configuration) request.getAttribute("configuration");
%>

<html>
<head>
    <title>Update configuration</title>
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
</body>
</html>
