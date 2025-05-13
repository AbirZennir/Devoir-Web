<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un compte - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card mx-auto" style="max-width: 450px;">
        <div class="card-body">
            <h3 class="card-title text-center mb-4">Créer un compte</h3>

            <!-- Message d'erreur -->
            <c:if test="${not empty error}">
                <div class="alert alert-danger text-center">${error}</div>
            </c:if>

            <form action="signup" method="post">
                <div class="mb-3">
                    <label>Email</label>
                    <input type="email" name="email" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label>Nom d'utilisateur</label>
                    <input type="text" name="username" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label>Mot de passe</label>
                    <input type="password" name="password" class="form-control" required />
                </div>

                <div class="mb-3">
                    <label>Rôle</label>
                    <select name="role" class="form-select" required>
                        <option value="STUDENT">Étudiant</option>
                        <option value="TEACHER">Enseignant</option>
                        <option value="ADMIN">Admin</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-success w-100">Créer mon compte</button>
            </form>

            <div class="text-center mt-3">
                <span>Déjà inscrit ?</span><br>
                <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-primary mt-2">Se connecter</a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
