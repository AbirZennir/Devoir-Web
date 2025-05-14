package com.devoir.devoir.controller;

import com.devoir.devoir.repository.AssignmentRepository;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.GradeRepository;
import com.devoir.devoir.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class StudentDashboardController {

    @Autowired
    private UserRepository userRepo;

    @Autowired
    private GradeRepository gradeRepo;

    @Autowired
    private CourseRepository courseRepo;

    @Autowired
    private AssignmentRepository assignmentRepo;

    @GetMapping("/student/dashboard")
    public String dashboard(Model model) {
        Long studentId = 1L; // à remplacer par l'ID de l'utilisateur connecté
        model.addAttribute("noteCount", gradeRepo.countByStudent_Id(studentId));
        model.addAttribute("assignmentCount", assignmentRepo.countByStudent_Id(studentId));
        model.addAttribute("courseCount", courseRepo.countByTeacher_Id(studentId)); // ou autre selon logique réelle
        return "student/dashboard";
    }
}
