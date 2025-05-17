<jsp:include page="/WEB-INF/views/components/sidebar.jsp" />
<jsp:include page="/WEB-INF/views/components/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord Enseignant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
    <h2>Bienvenue, ${user.firstName} ${user.lastName}</h2>

    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Cours gérés</h5>
                    <p class="card-text fs-4">${courseCount}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Devoirs actifs</h5>
                    <p class="card-text fs-4">${activeAssignments}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Étudiants total</h5>
                    <p class="card-text fs-4">${studentCount}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <h4>Mes devoirs récents</h4>
        <table class="table table-bordered">
            <thead>
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
                    <td>${d.titre}</td> <!-- ✅ corrigé ici -->
                    <td>${d.course.nom}</td>
                    <td>${d.deadline}</td>
                    <td>${d.submissionsCount}</td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
