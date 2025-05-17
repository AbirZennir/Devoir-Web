<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Créer un Cours</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<jsp:include page="/WEB-INF/views/components/header.jsp" />
<div class="d-flex">
    <jsp:include page="/WEB-INF/views/components/sidebar.jsp" />

    <main class="container mt-5">
        <h2>📚 Créer un cours</h2>

        <form action="${pageContext.request.contextPath}/teacher/courses/create" method="post">
            <div class="mb-3">
                <label for="nom" class="form-label">Nom du cours</label>
                <input type="text" class="form-control" id="nom" name="nom" required>
            </div>

            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" id="description" name="description" rows="3"></textarea>
            </div>

            <button type="submit" class="btn btn-success">Créer</button>
            <a href="${pageContext.request.contextPath}/teacher/assignments" class="btn btn-secondary ms-2">Retour</a>
        </form>
    </main>
</div>

</body>
</html>
