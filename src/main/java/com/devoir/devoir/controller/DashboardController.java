package com.devoir.devoir.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/user/dashboard")
    public String showUserDashboard(HttpSession session) {
        // Tu peux ajouter une vérification de session ici si tu veux
        return "user/dashboard"; // Correspond à /WEB-INF/views/user/dashboard.jsp
    }

    @GetMapping("/admin/dashboard")
    public String showAdminDashboard() {
        return "admin/dashboard";
    }

    @GetMapping("/teacher/dashboard")
    public String showTeacherDashboard() {
        return "teacher/dashboard";
    }
}

