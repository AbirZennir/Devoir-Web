<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../components/header.jsp" %>
<%@ include file="../components/sidebar.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Correction des devoirs</h2>

    <c:forEach var="soumission" items="${soumissions}">
        <div class="card mb-4">
            <div class="card-body">
                <h5 class="card-title">${soumission.devoir.titre}</h5>
                <p><strong>Étudiant :</strong> ${soumission.etudiant.nomComplet}</p>
                <p><strong>Date de soumission :</strong> ${soumission.dateSoumission}</p>
                <p><strong>Fichier :</strong> <a href="/uploads/${soumission.fichier}" target="_blank">${soumission.fichier}</a></p>
                <p><strong>Commentaire étudiant :</strong><br>${soumission.commentaire}</p>

                <c:choose>
                    <c:when test="${soumission.statut eq 'NOTE'}">
                        <p class="text-success mt-2">✅ Devoir noté</p>
                        <p><strong>Note :</strong> ${soumission.note}/100</p>
                        <p><strong>Commentaire :</strong><br>${soumission.commentaireProf}</p>
                    </c:when>
                    <c:otherwise>
                        <form method="post" action="/teacher/noter">
                            <input type="hidden" name="soumissionId" value="${soumission.id}"/>

                            <div class="row mb-3">
                                <div class="col-md-2">
                                    <label for="note">Note</label>
                                    <input type="number" class="form-control" name="note" min="0" max="100" required>
                                </div>
                                <div class="col-md-10">
                                    <label for="commentaireProf">Commentaire</label>
                                    <textarea name="commentaireProf" class="form-control" rows="2"></textarea>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-success">Enregistrer la note</button>
                        </form>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </c:forEach>
</div>

<%@ include file="../components/footer.jsp" %>
