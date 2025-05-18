<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Liste des utilisateurs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="d-flex">
    <%@ include file="../components/sidebar.jsp" %>

    <div class="container-fluid mt-4">
        <h2 class="mb-3">👥 Liste des utilisateurs</h2>
        <input type="text" id="searchInput" class="form-control mb-3" placeholder="🔍 Rechercher un utilisateur...">

        <c:choose>
            <c:when test="${not empty users}">
                <table class="table table-bordered table-striped text-center" id="usersTable">
                    <thead class="table-dark">
                        <tr>
                            <th>ID</th>
                            <th>Nom complet</th>
                            <th>Email</th>
                            <th>Rôle</th>
                            <th>Actif</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${users}" var="u">
                            <tr>
                                <td>${u.id}</td>
                                <td>${u.firstName} ${u.lastName}</td>
                                <td>${u.email}</td>
                                <td>${u.role}</td>
                                <td>
                                    <c:choose>
                                        <c:when test="${u.active}">Oui</c:when>
                                        <c:otherwise>Non</c:otherwise>
                                    </c:choose>
                                </td>
                                <td>
                                    <a href="/admin/users/edit/${u.id}" class="btn btn-warning btn-sm">Modifier</a>
                                    <a href="/admin/users/delete/${u.id}" class="btn btn-danger btn-sm"
                                       onclick="return confirm('Voulez-vous vraiment supprimer cet utilisateur ?');">Supprimer</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:when>
            <c:otherwise>
                <div class="alert alert-warning">Aucun utilisateur trouvé.</div>
            </c:otherwise>
        </c:choose>
    </div>
</div>

<script>
    document.getElementById('searchInput').addEventListener('keyup', function () {
        const search = this.value.toLowerCase();
        document.querySelectorAll('#usersTable tbody tr').forEach(row => {
            row.style.display = row.textContent.toLowerCase().includes(search) ? '' : 'none';
        });
    });
</script>
</body>
</html>
