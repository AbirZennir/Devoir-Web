<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../components/header.jsp" %>
<%@ include file="../components/sidebar.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Soumettre un devoir</h2>

    <div class="card mb-4">
        <div class="card-body">
            <h4>${devoir.titre}</h4>
            <p class="text-muted">Cours : ${devoir.cours.nom}</p>
            <p><strong>Date limite :</strong> ${devoir.deadline}</p>
            <p>${devoir.description}</p>
        </div>
    </div>

    <form action="/user/soumettre" method="post" enctype="multipart/form-data">
        <input type="hidden" name="devoirId" value="${devoir.id}"/>

        <div class="mb-3">
            <label for="file" class="form-label">Fichier à soumettre</label>
            <input type="file" name="file" class="form-control" required>
        </div>

        <div class="mb-3">
            <label for="commentaire" class="form-label">Commentaire (facultatif)</label>
            <textarea name="commentaire" class="form-control" rows="3"></textarea>
        </div>

        <button type="submit" class="btn btn-primary">Soumettre</button>
        <a href="/user/devoirs" class="btn btn-secondary">Annuler</a>
    </form>
</div>

<%@ include file="../components/footer.jsp" %>
