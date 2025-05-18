<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Dashboard - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<div class="d-flex">
    <%@ include file="../components/sidebar.jsp" %>

    <div class="container-fluid p-4">
        <h2 class="mb-4"><i class="bi bi-bar-chart-fill"></i> Administration</h2>

        <c:choose>
            <c:when test="${not empty user}">
                <p>Bienvenue, <strong>${user.firstName}</strong>. Voici un aperçu de la plateforme.</p>
            </c:when>
            <c:otherwise>
                <p class="text-danger">Aucun utilisateur connecté.</p>
            </c:otherwise>
        </c:choose>

        <div class="row text-center mb-4">
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>Utilisateurs totaux</h5>
                    <h3>${userCount}</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>Cours</h5>
                    <h3>${courseCount}</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>Devoirs</h5>
                    <h3>${assignmentCount}</h3>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card p-3">
                    <h5>Notes attribuées</h5>
                    <h3>${gradeCount}</h3>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6 mb-4">
                <div class="card p-3">
                    <h5>Activité des devoirs et notes</h5>
                    <canvas id="activityChart"></canvas>
                </div>
            </div>
            <div class="col-md-6 mb-4">
                <div class="card p-3">
                    <h5>Répartition des utilisateurs</h5>
                    <canvas id="userChart"></canvas>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    const ctx = document.getElementById('activityChart').getContext('2d');
    const activityChart = new Chart(ctx, {
        type: 'bar',
        data: {
            labels: ['Jan', 'Fév', 'Mar', 'Avr', 'Mai', 'Juin'],
            datasets: [
                {
                    label: 'Devoirs',
                    data: [<c:forEach items="${assignmentsByMonth}" var="v" varStatus="loop">${v}<c:if test="${!loop.last}">,</c:if></c:forEach>],
                    backgroundColor: 'rgba(54, 162, 235, 0.7)'
                },
                {
                    label: 'Notes',
                    data: [<c:forEach items="${gradesByMonth}" var="v" varStatus="loop">${v}<c:if test="${!loop.last}">,</c:if></c:forEach>],
                    backgroundColor: 'rgba(255, 99, 132, 0.7)'
                }
            ]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
