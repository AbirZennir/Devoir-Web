<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../components/header.jsp" %>
<%@ include file="../components/sidebar.jsp" %>

<div class="container mt-5">
    <h2 class="mb-4">Devoirs</h2>
    <p>Consultez vos devoirs à rendre et soumis.</p>

    <div class="d-flex justify-content-between mb-3">
        <div>
            <button class="btn btn-outline-primary active">Grille</button>
            <button class="btn btn-outline-secondary">Liste</button>
        </div>
        <div class="d-flex gap-2">
            <input type="text" class="form-control" placeholder="Rechercher...">
            <select class="form-select">
                <option>Tous les cours</option>
            </select>
            <select class="form-select">
                <option>Tous les statuts</option>
            </select>
        </div>
    </div>

    <div class="row">
        <c:forEach var="devoir" items="${devoirs}">
            <div class="col-md-4">
                <div class="card mb-4 shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">${devoir.titre}</h5>
                        <h6 class="card-subtitle mb-2 text-muted">${devoir.cours.nom}</h6>
                        <p class="card-text">${devoir.description}</p>

                        <p class="mb-1"><i class="bi bi-calendar"></i> ${devoir.deadline}</p>
                        <p class="text-muted">${devoir.joursRestants} jour(s) restant(s)</p>

                        <c:choose>
                            <c:when test="${devoir.statut eq 'A_RENDRE'}">
                                <span class="badge bg-warning text-dark">À rendre</span>
                                <a href="/user/soumettre?id=${devoir.id}" class="btn btn-primary mt-2">Soumettre</a>
                            </c:when>
                            <c:when test="${devoir.statut eq 'RENDUE'}">
                                <span class="badge bg-primary">Rendu</span>
                                <a href="/user/soumission?id=${devoir.id}" class="btn btn-outline-primary mt-2">Voir soumission</a>
                            </c:when>
                            <c:when test="${devoir.statut eq 'NOTE'}">
                                <span class="badge bg-success">Noté</span>
                                <p class="mt-2">Note : <strong>${devoir.note}/100</strong></p>
                                <a href="/user/notes?id=${devoir.id}" class="btn btn-outline-success">Voir note</a>
                            </c:when>
                        </c:choose>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

<%@ include file="../components/footer.jsp" %>
