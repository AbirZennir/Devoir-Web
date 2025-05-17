<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/components/header.jsp" %>
<%@ include file="/WEB-INF/views/components/sidebar.jsp" %>

<div class="container mt-5">
    <div class="d-flex justify-content-between align-items-center mb-3">
        <h2>📘 Mes Devoirs</h2>
        <a href="${pageContext.request.contextPath}/teacher/assignments/create" class="btn btn-primary">
            + Nouveau Devoir
        </a>
    </div>

    <c:if test="${empty assignments}">
        <div class="alert alert-info">Aucun devoir trouvé.</div>
    </c:if>

    <c:if test="${not empty assignments}">
        <table class="table table-bordered">
            <thead class="table-light">
                <tr>
                    <th>Titre</th>
                    <th>Description</th>
                    <th>Date création</th>
                    <th>Deadline</th>
                    <th>Statut</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="a" items="${assignments}">
                    <tr>
                        <td>${a.titre}</td>
                        <td>${a.description}</td>
                        <td>${a.dateCreation}</td>
                        <td>${a.deadline}</td>
                        <td>${a.status}</td>
                        <td>
                            <a href="${pageContext.request.contextPath}/teacher/assignments/edit/${a.id}" class="btn btn-sm btn-warning">
                                ✏️ Modifier
                            </a>
                            <form action="${pageContext.request.contextPath}/teacher/assignments/delete/${a.id}" method="get" style="display:inline;">
                                <button type="submit" class="btn btn-sm btn-danger" onclick="return confirm('Confirmer la suppression ?')">
                                    🗑️ Supprimer
                                </button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Pagination -->
        <nav>
            <ul class="pagination justify-content-center">
                <c:forEach begin="0" end="${totalPages - 1}" var="i">
                    <li class="page-item ${i == currentPage ? 'active' : ''}">
                        <a class="page-link" href="?page=${i}">${i + 1}</a>
                    </li>
                </c:forEach>
            </ul>
        </nav>
    </c:if>
</div>
