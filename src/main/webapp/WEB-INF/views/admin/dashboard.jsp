<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Admin Dashboard - Demandes d'inscription</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            padding: 40px;
        }
        h2 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            padding: 12px;
            border: 1px solid #ccc;
            text-align: center;
        }
        th {
            background-color: #2575fc;
            color: white;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        form {
            display: inline;
        }
        button {
            padding: 6px 14px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .accept {
            background-color: #28a745;
            color: white;
        }
        .reject {
            background-color: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <h2>Demandes d'inscription en attente</h2>

    <table>
        <thead>
            <tr>
                <th>ID</th>
                <th>Étudiant</th>
                <th>Cours</th>
                <th>Date</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="req" items="${requests}">
                <tr>
                    <td>${req.id}</td>
                    <td>${req.user.firstName} ${req.user.lastName}</td>
                    <td>${req.course.nom}</td>
                    <td>${req.createdAt}</td>
                    <td>
                        <form action="/admin/accept/${req.id}" method="post">
                            <button class="accept">Accepter</button>
                        </form>
                        <form action="/admin/reject/${req.id}" method="post">
                            <button class="reject">Rejeter</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
