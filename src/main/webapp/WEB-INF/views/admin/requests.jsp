<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Demandes de Cours</title>
</head>
<body>
<h2>Demandes d'accès aux cours</h2>
<table border="1">
    <tr>
        <th>Étudiant</th>
        <th>Cours</th>
        <th>Date</th>
        <th>Action</th>
    </tr>
    <c:forEach var="req" items="${requests}">
        <tr>
            <td>${req.user.username}</td>
            <td>${req.course.nom}</td>
            <td>${req.requestedAt}</td>
            <td>
                <form method="post" action="/admin/requests/${req.id}/accept" style="display:inline">
                    <button type="submit">Accepter</button>
                </form>
                <form method="post" action="/admin/requests/${req.id}/reject" style="display:inline">
                    <button type="submit">Refuser</button>
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
</body>
</html>