<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord Étudiant - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<!-- ✅ Conteneur principal en flex horizontal -->
<div class="d-flex min-vh-100">
    <%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

    <!-- ✅ Contenu principal -->
    <div class="container-fluid p-4">
        <h2 class="mb-4"><i class="bi bi-person-fill"></i> Bonjour, ${user.firstName} ${user.lastName}</h2>

        <!-- Cartes statistiques -->
        <div class="row text-center mb-4">
            <div class="col-md-4">
                <div class="card p-3">
                    <h5>Devoirs à faire</h5>
                    <h3>${assignmentsToDo}</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3">
                    <h5>Devoirs soumis</h5>
                    <h3>${submittedAssignments}</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card p-3">
                    <h5>Cours inscrits</h5>
                    <h3>${enrolledCourses}</h3>
                </div>
            </div>
        </div>

        <!-- Tableau des devoirs récents -->
        <div class="mt-5">
            <h4><i class="bi bi-journal-text"></i> Devoirs récents</h4>
            <table class="table table-striped table-hover mt-3">
                <thead class="table-dark">
                <tr>
                    <th>Titre</th>
                    <th>Cours</th>
                    <th>Échéance</th>
                    <th>Statut</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="d" items="${assignments}">
                    <tr>
                        <td>${d.title}</td>
                        <td>${d.course.name}</td>
                        <td>${d.deadline}</td>
                        <td>
                            <span class="badge bg-${d.submitted ? 'success' : 'warning'}">
                                ${d.submitted ? 'Soumis' : 'À faire'}
                            </span>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
</html>
