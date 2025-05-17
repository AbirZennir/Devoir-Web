<h2>Liste des classes</h2>
<a href="/admin/classes/create">Créer une nouvelle classe</a>
<table border="1">
    <tr><th>Nom</th><th>Niveau</th><th>Professeur</th></tr>
    <c:forEach items="${classes}" var="classe">
        <tr>
            <td>${classe.nom}</td>
            <td>${classe.niveau}</td>
            <td>${classe.responsable.nom}</td>
        </tr>
    </c:forEach>
</table>
