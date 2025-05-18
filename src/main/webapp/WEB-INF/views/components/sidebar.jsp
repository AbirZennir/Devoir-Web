<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">

<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 250px; height: 100vh;">
  <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
    <span class="fs-4">Devoir-App</span>
  </a>
  <hr>

  <ul class="nav nav-pills flex-column mb-auto">
    <c:choose>

      <c:when test="${user.role == 'ADMIN'}">
        <li><a href="${pageContext.request.contextPath}/admin/dashboard" class="nav-link text-white"><i class="bi bi-speedometer2"></i> Tableau de bord</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/users" class="nav-link text-white"><i class="bi bi-people"></i> Utilisateurs</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/courses" class="nav-link text-white"><i class="bi bi-journal-bookmark"></i> Cours</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/classes" class="nav-link text-white"><i class="bi bi-door-open"></i> Classes</a></li>
        <li><a href="${pageContext.request.contextPath}/admin/classes/create" class="nav-link text-white"><i class="bi bi-plus-square"></i> Créer Classe</a></li>
      </c:when>

      <c:when test="${user.role == 'TEACHER'}">
        <li><a href="${pageContext.request.contextPath}/teacher/dashboard" class="nav-link text-white"><i class="bi bi-speedometer2"></i> Tableau de bord</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/assignments" class="nav-link text-white">📄 Mes Devoirs</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/assignments/create" class="nav-link text-white">➕ Créer un devoir</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/courses" class="nav-link text-white">📚 Mes Cours</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/courses/create" class="nav-link text-white">➕ Créer un cours</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/classes" class="nav-link text-white">📘 Mes Classes</a></li>
        <li><a href="${pageContext.request.contextPath}/teacher/notes" class="nav-link text-white">📊 Notes</a></li>
      </c:when>

      <c:when test="${user != null && user.role == 'STUDENT'}">

        <li><a href="${pageContext.request.contextPath}/user/dashboard" class="nav-link text-white"><i class="bi bi-speedometer2"></i> Tableau de bord</a></li>
        <li><a href="${pageContext.request.contextPath}/user/devoirs" class="nav-link text-white"><i class="bi bi-journal-text"></i> Mes Devoirs</a></li>
        <li><a href="${pageContext.request.contextPath}/user/my-courses" class="nav-link text-white"><i class="bi bi-book"></i> Mes Cours</a></li>
        <li>
          <a href="${pageContext.request.contextPath}/user/notes" class="nav-link text-white d-flex justify-content-between align-items-center">
            <span><i class="bi bi-clipboard-data"></i> Mes Notes</span>
            <c:if test="${not empty moyenne}">
              <span class="badge bg-primary ms-2">${moyenne}/100</span>
            </c:if>
          </a>
        </li>
        <li><a href="${pageContext.request.contextPath}/user/soumettre" class="nav-link text-white"><i class="bi bi-upload"></i> Soumettre Devoir</a></li>
        <li><a href="${pageContext.request.contextPath}/user/soumission" class="nav-link text-white"><i class="bi bi-eye"></i> Ma Soumission</a></li>
      </c:when>

    </c:choose>

    <li><a href="${pageContext.request.contextPath}/logout" class="nav-link text-white">🚪 Déconnexion</a></li>
  </ul>

  <hr>
  <div class="dropdown">
    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle"
       data-bs-toggle="dropdown" aria-expanded="false">
      <strong>${user.firstName}</strong>
    </a>
    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
      <li><a class="dropdown-item" href="#">Profil</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="${pageContext.request.contextPath}/logout">Déconnexion</a></li>
    </ul>
  </div>
</div>
