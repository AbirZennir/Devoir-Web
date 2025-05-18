<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard Enseignant - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

    <div class="container-fluid p-4">
        <h2 class="mb-4"><i class="bi bi-person-badge-fill"></i> Tableau de bord Enseignant</h2>

        <c:choose>
            <c:when test="${not empty user}">
                <p>Bienvenue, <strong>${user.firstName} ${user.lastName}</strong>. Voici vos statistiques actuelles.</p>
            </c:when>
            <c:otherwise>
                <p class="text-danger">Aucun utilisateur connecté.</p>
            </c:otherwise>
        </c:choose>

        <div class="row text-center mb-4">
            <div class="col-md-4">
                <div class="card p-3">
                    <h5>Cours gérés</h5>
                    <h3>${courseCount}</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3">
                    <h5>Devoirs actifs</h5>
                    <h3>${activeAssignments}</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3">
                    <h5>Étudiants total</h5>
                    <h3>${studentCount}</h3>
                </div>
            </div>
        </div>

        <div class="card p-3">
            <h5><i class="bi bi-clock-history"></i> Mes devoirs récents</h5>
            <table class="table table-bordered mt-3 text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Titre</th>
                        <th>Cours</th>
                        <th>Date limite</th>
                        <th>Soumissions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="d" items="${assignments}">
                        <tr>
                            <td>${d.titre}</td>
                            <td>${d.course.nom}</td>
                            <td>${d.deadline}</td>
                            <td>${d.submissionsCount}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
