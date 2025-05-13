<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Mes cours</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f6fa;
            padding: 30px;
        }

        h2 {
            color: #333;
        }

        .message {
            font-size: 14px;
            margin-bottom: 20px;
        }

        .success { color: green; }
        .error { color: red; }

        table {
            width: 100%;
            border-collapse: collapse;
            background: white;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 12px;
            text-align: center;
        }

        th {
            background-color: #2575fc;
            color: white;
        }

        form {
            margin: 0;
        }

        .btn {
            padding: 6px 12px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 13px;
        }

        .btn:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>

<h2>Mes cours</h2>

<c:if test="${not empty success}">
    <div class="message success">${success}</div>
</c:if>
<c:if test="${not empty error}">
    <div class="message error">${error}</div>
</c:if>

<h3>Cours validés</h3>
<ul>
    <c:forEach var="course" items="${acceptedCourses}">
        <li>${course.nom}</li>
    </c:forEach>
</ul>

<h3>Cours disponibles</h3>
<table>
    <thead>
        <tr>
            <th>Nom</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="course" items="${availableCourses}">
            <tr>
                <td>${course.nom}</td>
                <td>${course.description}</td>
                <td>
                    <form method="post" action="/user/courses/request">
                        <input type="hidden" name="courseId" value="${course.id}" />
                        <button class="btn" type="submit">Demander accès</button>
                    </form>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
