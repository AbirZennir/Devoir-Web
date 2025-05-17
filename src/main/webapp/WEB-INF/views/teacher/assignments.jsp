<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Mes Devoirs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body>
    <div class="d-flex">
        <%@ include file="../components/sidebar.jsp" %>

        <div class="container mt-4">
            <h2 class="mb-4">📝 Liste de mes devoirs</h2>

            <c:if test="${empty assignments}">
                <div class="alert alert-info">Aucun devoir trouvé.</div>
            </c:if>

            <c:if test="${not empty assignments}">
                <table class="table table-bordered table-striped table-hover">
                    <thead class="table-dark">
                        <tr>
                            <th>Titre</th>
                            <th>Description</th>
                            <th>Date de création</th>
                            <th>Deadline</th>
                            <th>Statut</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="assignment" items="${assignments}">
                            <tr>
                                <td>${assignment.titre}</td>
                                <td>${assignment.description}</td>
                                <td>${assignment.dateCreation}</td>
                                <td>${assignment.deadline}</td>
                                <td>
                                    <span class="badge 
                                        <c:choose>
                                            <c:when test="${assignment.status eq 'pending'}">bg-warning</c:when>
                                            <c:when test="${assignment.status eq 'completed'}">bg-success</c:when>
                                            <c:otherwise>bg-secondary</c:otherwise>
                                        </c:choose>">
                                        ${assignment.status}
                                    </span>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </c:if>
        </div>
    </div>
</body>
</html>
