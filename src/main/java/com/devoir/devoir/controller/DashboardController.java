package com.devoir.devoir.controller;

import com.devoir.devoir.model.Assignment;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.AssignmentRepository;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.GradeRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.List;

@Controller
public class DashboardController {

    @Autowired
    private AssignmentRepository assignmentRepo;

    @Autowired
    private CourseRepository courseRepo;

    @Autowired
    private GradeRepository gradeRepo;

    @GetMapping("/user/dashboard")
    public String showUserDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");

        if (user == null || !"STUDENT".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        Long studentId = user.getId();

        // Récupération des devoirs et statut soumis
        List<Assignment> assignments = assignmentRepo.findAllByStudentId(studentId);
        for (Assignment a : assignments) {
            a.setSubmitted("submitted".equalsIgnoreCase(a.getStatus()));
        }

        model.addAttribute("user", user);
        model.addAttribute("assignmentsToDo", assignmentRepo.countPendingByStudentId(studentId));
        model.addAttribute("submittedAssignments", assignmentRepo.countSubmittedByStudentId(studentId));
        model.addAttribute("enrolledCourses", courseRepo.countByStudents_Id(studentId));
        model.addAttribute("assignments", assignments);
        model.addAttribute("moyenne", gradeRepo.getMoyenneByStudentId(studentId));

        return "user/dashboard";
    }
}
