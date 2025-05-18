<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créer une classe</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="../components/sidebar.jsp" %>

    <div class="container-fluid mt-4">
        <h2>➕ Créer une nouvelle classe</h2>
        <form action="${pageContext.request.contextPath}/admin/classes/save" method="post">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom de la classe</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description"></textarea>
            </div>

            <div class="mb-3">
                <label for="professeur" class="form-label">Professeur responsable</label>
                <select class="form-select" id="professeur" name="professeurId" required>
                    <c:forEach var="p" items="${professeurs}">
                        <option value="${p.id}">${p.firstName} ${p.lastName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="etudiants" class="form-label">Étudiants (optionnel)</label>
                <select class="form-select" id="etudiants" name="etudiantIds" multiple>
                    <c:forEach var="e" items="${etudiants}">
                        <option value="${e.id}">${e.firstName} ${e.lastName}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="mb-3">
                <label for="courses" class="form-label">Cours</label>
                <select name="courses" multiple class="form-select">
                    <c:forEach var="course" items="${courses}">
                        <option value="${course.id}">${course.nom}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-success">Créer</button>
        </form>
    </div>
</div>
</body>
</html>
