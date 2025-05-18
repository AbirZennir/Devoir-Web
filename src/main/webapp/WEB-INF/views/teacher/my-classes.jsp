<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mes Classes</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="../components/sidebar.jsp" %>

    <div class="container mt-4">
        <h2 class="mb-4">📘 Ma Classe</h2>

        <c:if test="${empty classe}">
            <div class="alert alert-warning">Aucune classe assignée.</div>
        </c:if>

        <c:if test="${not empty classe}">
            <div class="mb-3">
                <h4>Nom : ${classe.nom}</h4>
                <p>Niveau : ${classe.niveau}</p>
            </div>

            <h5>👥 Étudiants de cette classe :</h5>
            <c:if test="${empty etudiants}">
                <div class="alert alert-info">Aucun étudiant dans cette classe.</div>
            </c:if>

            <c:if test="${not empty etudiants}">
                <table class="table table-striped">
                    <thead class="table-dark">
                        <tr>
                            <th>Nom</th>
                            <th>Prénom</th>
                            <th>Email</th>
                            <th>Nom d'utilisateur</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="etudiant" items="${etudiants}">
                            <tr>
                                <td>${etudiant.lastName}</td>
                                <td>${etudiant.firstName}</td>
                                <td>${etudiant.email}</td>
                                <td>${etudiant.username}</td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </c:if>
    </div>
</div>
</body>
</html>
