<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Modifier utilisateur</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="../components/sidebar.jsp" %>

    <div class="container-fluid mt-4">
        <h2>✏️ Modifier l'utilisateur</h2>

        <form action="/admin/users/edit/${user.id}" method="post" class="mt-3">
            <div class="mb-3">
                <label class="form-label">Prénom</label>
                <input type="text" name="firstName" value="${user.firstName}" class="form-control" required />
            </div>
            <div class="mb-3">
                <label class="form-label">Nom</label>
                <input type="text" name="lastName" value="${user.lastName}" class="form-control" required />
            </div>
            <div class="mb-3">
                <label class="form-label">Email</label>
                <input type="email" name="email" value="${user.email}" class="form-control" required />
            </div>
            <div class="mb-3">
                <label class="form-label">Rôle</label>
                <select name="role" class="form-select">
                    <option value="ADMIN" ${user.role == 'ADMIN' ? 'selected' : ''}>ADMIN</option>
                    <option value="TEACHER" ${user.role == 'TEACHER' ? 'selected' : ''}>TEACHER</option>
                    <option value="STUDENT" ${user.role == 'STUDENT' ? 'selected' : ''}>STUDENT</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Actif</label>
                <select name="active" class="form-select">
                    <option value="true" ${user.active ? 'selected' : ''}>Oui</option>
                    <option value="false" ${!user.active ? 'selected' : ''}>Non</option>
                </select>
            </div>

            <button type="submit" class="btn btn-success">💾 Enregistrer</button>
            <a href="/admin/users" class="btn btn-secondary">Retour</a>
        </form>
    </div>
</div>
</body>
</html>
