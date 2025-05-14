<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- sidebar.jsp -->
<div class="d-flex flex-column flex-shrink-0 p-3 text-bg-dark" style="width: 250px; height: 100vh;">
  <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto text-white text-decoration-none">
    <span class="fs-4">Devoir-App</span>
  </a>
  <hr>
  <ul class="nav nav-pills flex-column mb-auto">
    <li class="nav-item">
      <a href="${pageContext.request.contextPath}/${user.role.toLowerCase()}/dashboard" class="nav-link text-white">
        <i class="bi bi-speedometer2"></i>
        Tableau de bord
      </a>
    </li>
    <c:if test="${user.role == 'ADMIN'}">
      <li><a href="/admin/users" class="nav-link text-white">Utilisateurs</a></li>
      <li><a href="/admin/courses" class="nav-link text-white">Cours</a></li>
    </c:if>
    <c:if test="${user.role == 'TEACHER'}">
      <li><a href="/teacher/assignments" class="nav-link text-white">Mes Devoirs</a></li>
    </c:if>
    <c:if test="${user.role == 'STUDENT'}">
      <li><a href="/user/assignments" class="nav-link text-white">Mes Devoirs</a></li>
      <li><a href="/user/notes" class="nav-link text-white">Mes Notes</a></li>
    </c:if>
    <li>
      <a href="/logout" class="nav-link text-white">Déconnexion</a>
    </li>
  </ul>
  <hr>
  <div class="dropdown">
    <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
      <strong>${user.firstName}</strong>
    </a>
    <ul class="dropdown-menu dropdown-menu-dark text-small shadow">
      <li><a class="dropdown-item" href="#">Profil</a></li>
      <li><hr class="dropdown-divider"></li>
      <li><a class="dropdown-item" href="/logout">Déconnexion</a></li>
    </ul>
  </div>
</div>
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
