<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Connexion - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card mx-auto" style="max-width: 400px;">
        <div class="card-body">
            <h3 class="card-title text-center">Connexion</h3>

            <!-- Afficher les erreurs -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">${error}</div>
            </c:if>

            <!-- Afficher un message si déconnecté ou inscrit -->
            <c:if test="${not empty msg}">
                <div class="alert alert-success text-center">${msg}</div>
            </c:if>

            <!-- Formulaire de login -->
            <form method="post" action="login">
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label>Mot de passe</label>
                    <input type="password" name="password" class="form-control" required/>
                </div>
                <div class="mb-3">
                    <label>Rôle</label>
                    <select name="role" class="form-select">
                        <option value="ADMIN">Admin</option>
                        <option value="TEACHER">Enseignant</option>
                        <option value="STUDENT">Étudiant</option>
                    </select>
                </div>
                <button type="submit" class="btn btn-primary w-100">Se connecter</button>
            </form>

            <!-- Lien vers inscription -->
            <div class="text-center mt-3">
                <span>Pas encore de compte ?</span><br>
                <a href="${pageContext.request.contextPath}/signup" class="btn btn-outline-secondary mt-2">Créer un compte</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
