<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Accueil - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5 text-center">
    <h1 class="mb-4">Bienvenue sur Devoir-App</h1>

    <c:choose>
        <c:when test="${not empty loggedInUser}">
            <h4>Bonjour, ${loggedInUser.email} 👋</h4>
            <form action="${pageContext.request.contextPath}/logout" method="post" class="mb-3">
                <button class="btn btn-danger">Déconnexion</button>
            </form>
            <c:choose>
                <c:when test="${loggedInUser.role == 'ADMIN'}">
                    <a href="admin/dashboard" class="btn btn-primary">Tableau de bord Admin</a>
                </c:when>
                <c:when test="${loggedInUser.role == 'TEACHER'}">
                    <a href="teacher/dashboard" class="btn btn-primary">Tableau de bord Enseignant</a>
                </c:when>
                <c:when test="${loggedInUser.role == 'STUDENT'}">
                    <a href="user/dashboard" class="btn btn-primary">Tableau de bord Étudiant</a>
                </c:when>
            </c:choose>
        </c:when>
        <c:otherwise>
            <div class="d-flex justify-content-center gap-3">
                <a href="login" class="btn btn-outline-primary">Connexion</a>
                <a href="signup" class="btn btn-success">Créer un compte</a>
            </div>
        </c:otherwise>
    </c:choose>
</div>
</body>
</html>
