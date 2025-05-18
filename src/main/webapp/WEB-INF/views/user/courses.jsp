<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mes cours - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

    <div class="container-fluid p-4">
        <h2 class="mb-4"><i class="bi bi-journal-bookmark-fill"></i> Mes cours</h2>

        <!-- ✅ Affichage des messages -->
        <c:if test="${not empty success}">
            <div class="alert alert-success">${success}</div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger">${error}</div>
        </c:if>

        <!-- ✅ Liste des cours validés -->
        <h5><i class="bi bi-check2-circle"></i> Cours validés</h5>
        <ul class="list-group mb-4">
            <c:forEach var="course" items="${acceptedCourses}">
                <li class="list-group-item">${course.nom}</li>
            </c:forEach>
        </ul>

        <!-- ✅ Cours disponibles à demander -->
        <h5><i class="bi bi-book"></i> Cours disponibles</h5>
        <c:if test="${empty availableCourses}">
            <div class="alert alert-info">Aucun cours disponible actuellement.</div>
        </c:if>
        <c:if test="${not empty availableCourses}">
            <table class="table table-bordered table-hover text-center">
                <thead class="table-dark">
                    <tr>
                        <th>Nom</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="course" items="${availableCourses}">
                        <tr>
                            <td>${course.nom}</td>
                            <td>${course.description}</td>
                            <td>
                                <form method="post" action="/user/courses/request">
                                    <input type="hidden" name="courseId" value="${course.id}" />
                                    <button class="btn btn-success btn-sm" type="submit">
                                        <i class="bi bi-plus-circle"></i> Demander accès
                                    </button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</div>
</body>
</html>
