<jsp:include page="/WEB-INF/views/components/sidebar.jsp" />
<jsp:include page="/WEB-INF/views/components/header.jsp" />

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Tableau de bord Étudiant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
    <h2>Bonjour, ${user.firstName} ${user.lastName}</h2>

    <div class="row mt-4">
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Devoirs à faire</h5>
                    <p class="card-text fs-4">${assignmentsToDo}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Devoirs soumis</h5>
                    <p class="card-text fs-4">${submittedAssignments}</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-center">
                <div class="card-body">
                    <h5 class="card-title">Cours inscrits</h5>
                    <p class="card-text fs-4">${enrolledCourses}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="mt-5">
        <h4>Devoirs récents</h4>
        <table class="table table-striped">
            <thead>
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
                    <td><span class="badge bg-${d.submitted ? 'success' : 'warning'}">${d.submitted ? 'Soumis' : 'À faire'}</span></td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
