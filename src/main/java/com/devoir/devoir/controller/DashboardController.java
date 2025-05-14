package com.devoir.devoir.controller;

import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DashboardController {

    @GetMapping("/user/dashboard")
    public String showUserDashboard(HttpSession session) {
        return "user/dashboard";
    }

    // ❌ Supprimer cette méthode
    // @GetMapping("/teacher/dashboard")
    // public String showTeacherDashboard() {
    //     return "teacher/dashboard";
    // }

}
