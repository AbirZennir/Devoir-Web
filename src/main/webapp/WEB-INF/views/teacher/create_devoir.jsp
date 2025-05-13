<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Créer un Devoir</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-5">
    <div class="card mx-auto" style="max-width: 600px;">
        <div class="card-body">
            <h3 class="card-title text-center mb-4">Créer un nouveau devoir</h3>

            <form action="/devoirs/create" method="post">
                <div class="mb-3">
                    <label for="titre" class="form-label">Titre du devoir</label>
                    <input type="text" name="titre" id="titre" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="description" class="form-label">Description</label>
                    <textarea name="description" id="description" class="form-control" rows="4" required></textarea>
                </div>

                <div class="mb-3">
                    <label for="deadline" class="form-label">Date limite</label>
                    <input type="date" name="deadline" id="deadline" class="form-control" required>
                </div>

                <div class="mb-3">
                    <label for="coursId" class="form-label">Cours associé</label>
                    <select name="coursId" id="coursId" class="form-select" required>
                        <c:forEach var="cours" items="${coursList}">
                            <option value="${cours.id}">${cours.nom}</option>
                        </c:forEach>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary w-100">Créer le devoir</button>
            </form>
        </div>
    </div>
</div>
</body>
</html>
