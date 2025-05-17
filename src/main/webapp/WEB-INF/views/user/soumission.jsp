<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../components/header.jsp" %>
<%@ include file="../components/sidebar.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Ma soumission</h2>

    <div class="card">
        <div class="card-body">
            <h4>${soumission.devoir.titre}</h4>
            <p class="text-muted">Cours : ${soumission.devoir.cours.nom}</p>
            <p><strong>Date de soumission :</strong> ${soumission.dateSoumission}</p>

            <p><strong>Fichier soumis :</strong> 
                <a href="/uploads/${soumission.fichier}" target="_blank">${soumission.fichier}</a>
            </p>

            <p><strong>Commentaire :</strong><br>${soumission.commentaire}</p>

            <c:choose>
                <c:when test="${soumission.statut eq 'NOTE'}">
                    <hr>
                    <p class="text-success">✅ Ce devoir a été noté.</p>
                    <p><strong>Note obtenue :</strong> ${soumission.note}/100</p>
                    <p><strong>Commentaire de l'enseignant :</strong><br>${soumission.commentaireProf}</p>
                </c:when>
                <c:otherwise>
                    <p class="text-warning">⏳ Ce devoir est en cours de correction.</p>
                </c:otherwise>
            </c:choose>

            <a href="/user/devoirs" class="btn btn-secondary mt-3">Retour</a>
        </div>
    </div>
</div>

<%@ include file="../components/footer.jsp" %>
