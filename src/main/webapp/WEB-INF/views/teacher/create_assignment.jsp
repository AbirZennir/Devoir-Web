<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créer un Devoir</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<jsp:include page="/WEB-INF/views/components/header.jsp" />
<div class="d-flex">
    <jsp:include page="/WEB-INF/views/components/sidebar.jsp" />

    <main class="container mt-4">
        <h2 class="mb-4">Créer un nouveau devoir</h2>

        <form action="${pageContext.request.contextPath}/enseignant/assignments/create" method="post">
            <div class="mb-3">
                <label for="titre" class="form-label">Titre du devoir</label>
                <input type="text" class="form-control" id="titre" name="titre" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="4" required></textarea>
            </div>

            <div class="mb-3">
                <label for="deadline" class="form-label">Date limite</label>
                <input type="date" class="form-control" id="deadline" name="deadline" required>
            </div>

            <div class="mb-3">
                <label for="course" class="form-label">Cours associé</label>
                <select class="form-select" id="course" name="course.id" required>
                    <option value="" selected disabled>Choisir un cours</option>
                    <c:forEach var="c" items="${courses}">
                        <option value="${c.id}">${c.nom}</option>
                    </c:forEach>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Créer</button>
        </form>
    </main>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
