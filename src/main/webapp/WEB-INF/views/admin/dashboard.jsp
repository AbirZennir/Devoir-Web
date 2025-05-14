<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/components/header.jsp" />
<jsp:include page="/WEB-INF/views/components/sidebar.jsp" />

<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body class="bg-light">
<div class="container-fluid">
    <div class="row">
        <div class="col-md-2 bg-primary text-white min-vh-100 p-4">
            <h4>Devoir-App</h4>
            <ul class="nav flex-column mt-4">
                <li class="nav-item"><a href="#" class="nav-link text-white">Tableau de bord</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white">Utilisateurs</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white">Cours</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white">Devoirs</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white">Notes</a></li>
                <li class="nav-item"><a href="#" class="nav-link text-white">Paramètres</a></li>
            </ul>
        </div>
        <div class="col-md-10 p-5">
            <h2 class="mb-4">Administration</h2>
            <p>Bienvenue, <strong>${adminName}</strong>. Voici un aperçu de la plateforme.</p>

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
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Activité des devoirs et notes</h5>
                        <canvas id="activityChart"></canvas>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="card p-3">
                        <h5>Répartition des utilisateurs</h5>
                        <canvas id="userChart"></canvas>
                    </div>
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
                    data: [
                        <c:forEach items="${assignmentsByMonth}" var="v" varStatus="loop">
                            ${v}<c:if test="${!loop.last}">,</c:if>
                        </c:forEach>
                    ],
                    backgroundColor: 'rgba(54, 162, 235, 0.7)'
                },
                {
                    label: 'Notes',
                    data: [
                        <c:forEach items="${gradesByMonth}" var="v" varStatus="loop">
                            ${v}<c:if test="${!loop.last}">,</c:if>
                        </c:forEach>
                    ],
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
