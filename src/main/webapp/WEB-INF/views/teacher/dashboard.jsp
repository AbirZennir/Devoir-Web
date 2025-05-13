<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Tableau de bord Enseignant</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<div class="container py-4">
    <h2 class="mb-4">Bienvenue sur votre tableau de bord, Enseignant</h2>

    <div class="row mb-4">
        <div class="col-md-4">
            <div class="card text-white bg-primary mb-3">
                <div class="card-body">
                    <h5 class="card-title">Cours gérés</h5>
                    <p class="card-text">3 cours</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-success mb-3">
                <div class="card-body">
                    <h5 class="card-title">Devoirs créés</h5>
                    <p class="card-text">12 devoirs</p>
                </div>
            </div>
        </div>
        <div class="col-md-4">
            <div class="card text-white bg-info mb-3">
                <div class="card-body">
                    <h5 class="card-title">Soumissions</h5>
                    <p class="card-text">28 soumissions</p>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex justify-content-between align-items-center mb-3">
        <h4>Liste de vos cours</h4>
        <a href="/create_devoir.jsp" class="btn btn-outline-primary">Ajouter un devoir</a>
    </div>

    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nom du cours</th>
            <th>Nombre de devoirs</th>
            <th>Dernière mise à jour</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>Programmation Java</td>
            <td>5</td>
            <td>10 mai 2025</td>
        </tr>
        <tr>
            <td>Bases de données</td>
            <td>3</td>
            <td>8 mai 2025</td>
        </tr>
        <tr>
            <td>Génie logiciel</td>
            <td>4</td>
            <td>7 mai 2025</td>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
