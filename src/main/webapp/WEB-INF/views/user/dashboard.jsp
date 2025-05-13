<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Tableau de bord - Étudiant</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #eef1f7;
            padding: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background: white;
        }

        th, td {
            padding: 12px;
            border-bottom: 1px solid #ccc;
        }

        th {
            background-color: #3f51b5;
            color: white;
        }

        .btn {
            padding: 6px 12px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn:disabled {
            background-color: #ccc;
            cursor: not-allowed;
        }

        .status {
            font-weight: bold;
        }

        .accepted { color: green; }
        .rejected { color: red; }
        .pending { color: orange; }
    </style>
</head>
<body>
<form action="${pageContext.request.contextPath}/logout" method="post">
    <button class="btn btn-danger" type="submit">Déconnexion</button>
</form>

    <h2>Mes Cours Disponibles</h2>

    <table>
        <tr>
            <th>Nom du cours</th>
            <th>Description</th>
            <th>Statut</th>
            <th>Action</th>
        </tr>
        <c:forEach var="matiere" items="${cours}">
            <tr>
                <td>${matiere.nom}</td>
                <td>${matiere.description}</td>

                <c:set var="status" value="${statuses[matiere.id]}" />

                <td class="status">
                    <c:choose>
                        <c:when test="${status == 'ACCEPTED'}"><span class="accepted">Accepté</span></c:when>
                        <c:when test="${status == 'REJECTED'}"><span class="rejected">Refusé</span></c:when>
                        <c:when test="${status == 'PENDING'}"><span class="pending">En attente</span></c:when>
                        <c:otherwise><span>—</span></c:otherwise>
                    </c:choose>
                </td>

                <td>
                    <c:choose>
                        <c:when test="${empty status || status == 'REJECTED'}">
                            <form method="post" action="/user/request-course">
                                <input type="hidden" name="courseId" value="${matiere.id}" />
                                <button type="submit" class="btn">Rejoindre</button>
                            </form>
                        </c:when>
                        <c:otherwise>
                            <button class="btn" disabled>Demande envoyée</button>
                        </c:otherwise>
                    </c:choose>
                </td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
