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
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/custom/css/style.css">
</head>
<body>
    <%@ include file="./../components/navbar.jsp"%>

    <main class="container-fluid px-4">
        <form class="custom-form" method="post" action="${pageContext.request.contextPath}/admin/configurations/save">
            <h1 class="text-center">Update configuration</h1>
            <input type="hidden" name="configuration.key" value="<%= configuration.getKey() %>">

            <div class="mb-3">
                <label class="form-label" for="displayName">Display name:</label>
                <input class="form-control" type="text" id="displayName" name="configuration.displayName" value="<%= configuration.getDisplayName() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="value">Value:</label>
                <input class="form-control" type="text" id="value" name="configuration.value" value="<%= configuration.getValue() %>" required>
            </div>

            <div class="mb-3">
                <label class="form-label" for="description">Description:</label>
                <input class="form-control" type="text" id="description" name="configuration.description" value="<%= configuration.getDescription() %>" required>
            </div>

            <button class="btn btn-primary w-100" type="submit">Update</button>
        </form>
    </main>

    <script src="${pageContext.request.contextPath}/static/bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
