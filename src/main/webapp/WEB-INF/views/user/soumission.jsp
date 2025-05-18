<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Ma soumission - Devoir-App</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

    <div class="container-fluid p-4">
        <h2 class="mb-4"><i class="bi bi-eye-fill"></i> Ma soumission</h2>

        <div class="card shadow-sm">
            <div class="card-body">
                <h4 class="card-title">${soumission.devoir.titre}</h4>
                <p class="card-subtitle text-muted mb-2"><i class="bi bi-journal-bookmark-fill"></i> ${soumission.devoir.cours.nom}</p>
                <p><i class="bi bi-calendar-check"></i> <strong>Date de soumission :</strong> ${soumission.dateSoumission}</p>

                <p><strong><i class="bi bi-file-earmark-arrow-down"></i> Fichier soumis :</strong> 
                    <a href="/uploads/${soumission.fichier}" target="_blank" class="text-decoration-underline">${soumission.fichier}</a>
                </p>

                <p><strong><i class="bi bi-chat-left-text"></i> Commentaire :</strong><br>${soumission.commentaire}</p>

                <hr>

                <c:choose>
                    <c:when test="${soumission.statut eq 'NOTE'}">
                        <p class="text-success"><i class="bi bi-patch-check-fill"></i> Ce devoir a été noté.</p>
                        <p><strong><i class="bi bi-award-fill"></i> Note obtenue :</strong> ${soumission.note}/100</p>
                        <p><strong><i class="bi bi-person-video2"></i> Commentaire de l'enseignant :</strong><br>${soumission.commentaireProf}</p>
                    </c:when>
                    <c:otherwise>
                        <p class="text-warning"><i class="bi bi-hourglass-split"></i> Ce devoir est en cours de correction.</p>
                    </c:otherwise>
                </c:choose>

                <a href="/user/devoirs" class="btn btn-secondary mt-3">
                    <i class="bi bi-arrow-left-circle"></i> Retour
                </a>
            </div>
        </div>
    </div>
</div>
</body>
</html>
