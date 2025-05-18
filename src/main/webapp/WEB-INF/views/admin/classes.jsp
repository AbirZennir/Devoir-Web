<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des classes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="../components/sidebar.jsp" %>

    <div class="container-fluid mt-4">
        <h2>📋 Liste des classes</h2>
        <a href="${pageContext.request.contextPath}/admin/classes/create" class="btn btn-primary mb-3">➕ Nouvelle classe</a>

        <c:if test="${empty classes}">
            <div class="alert alert-warning">Aucune classe disponible.</div>
        </c:if>

        <c:if test="${not empty classes}">
            <table class="table table-bordered table-striped text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Nom</th>
                        <th>Description</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="classe" items="${classes}">
                        <tr>
                            <td>${classe.nom}</td>
                            <td>${classe.description}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
