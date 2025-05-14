// AdminDashboardController.java
package com.devoir.devoir.controller;

import com.devoir.devoir.repository.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;
import java.util.Arrays;

@Controller
public class AdminDashboardController {
    @Autowired private UserRepository userRepo;
    @Autowired private AssignmentRepository assignmentRepo;
    @Autowired private GradeRepository gradeRepo;
    @Autowired private CourseRepository courseRepo;

    @GetMapping("/admin/dashboard")
    public String dashboard(Model model, HttpSession session) {
        model.addAttribute("userCount", userRepo.count());
        model.addAttribute("assignmentCount", assignmentRepo.count());
        model.addAttribute("courseCount", courseRepo.count());
        model.addAttribute("gradeCount", gradeRepo.count());

        // Simulation temporaire en attendant la requête SQL correcte dans le Repository
        List<Integer> assignmentsByMonth = Arrays.asList(5, 2, 4, 3, 1, 0);
        List<Integer> gradesByMonth = Arrays.asList(3, 1, 2, 4, 0, 1);

        model.addAttribute("assignmentsByMonth", assignmentsByMonth);
        model.addAttribute("gradesByMonth", gradesByMonth);

        return "admin/dashboard";
    }
}
