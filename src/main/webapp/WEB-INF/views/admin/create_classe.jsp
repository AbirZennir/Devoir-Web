<h2>Créer une classe</h2>
<form action="/admin/classes/create" method="post">
    Nom: <input type="text" name="nom" required><br>
    Niveau: <input type="text" name="niveau"><br>
    Professeur:
    <select name="responsable.id">
        <c:forEach items="${professeurs}" var="p">
            <option value="${p.id}">${p.nom}</option>
        </c:forEach>
    </select><br>
    <button type="submit">Créer</button>
</form>
