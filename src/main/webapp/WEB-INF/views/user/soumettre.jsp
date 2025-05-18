<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Soumettre un devoir - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

    <div class="container-fluid p-4">
        <h2 class="mb-4"><i class="bi bi-upload"></i> Soumettre un devoir</h2>

        <!-- ✅ Infos du devoir -->
        <div class="card mb-4 shadow-sm">
            <div class="card-body">
                <h4 class="card-title">${devoir.titre}</h4>
                <p class="card-subtitle text-muted mb-2"><i class="bi bi-journal-bookmark"></i> ${devoir.cours.nom}</p>
                <p><i class="bi bi-calendar-event"></i> <strong>Date limite :</strong> ${devoir.deadline}</p>
                <p>${devoir.description}</p>
            </div>
        </div>

        <!-- ✅ Formulaire de soumission -->
        <form action="/user/soumettre" method="post" enctype="multipart/form-data" class="shadow-sm p-4 bg-white rounded">
            <input type="hidden" name="devoirId" value="${devoir.id}"/>

            <div class="mb-3">
                <label for="file" class="form-label"><i class="bi bi-file-earmark-arrow-up"></i> Fichier à soumettre</label>
                <input type="file" name="file" id="file" class="form-control" required>
            </div>

            <div class="mb-3">
                <label for="commentaire" class="form-label"><i class="bi bi-chat-text"></i> Commentaire (facultatif)</label>
                <textarea name="commentaire" id="commentaire" class="form-control" rows="3" placeholder="Ajouter un commentaire..."></textarea>
            </div>

            <div class="d-flex gap-2">
                <button type="submit" class="btn btn-success"><i class="bi bi-send-check"></i> Soumettre</button>
                <a href="/user/devoirs" class="btn btn-secondary"><i class="bi bi-arrow-left"></i> Annuler</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
