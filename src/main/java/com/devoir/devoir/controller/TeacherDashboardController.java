package com.devoir.devoir.controller;

import com.devoir.devoir.repository.AssignmentRepository;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.UserRepository;
import com.devoir.devoir.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.security.Principal;
import java.util.Optional;

@Controller
public class TeacherDashboardController {
    @Autowired private AssignmentRepository assignmentRepo;
    @Autowired private CourseRepository courseRepo;
    @Autowired private UserRepository userRepo;

    @GetMapping("/teacher/dashboard")
    public String dashboard(Model model, Principal principal) {
        Optional<User> optionalUser = userRepo.findByEmail(principal.getName());
        if (optionalUser.isPresent()) {
            Long teacherId = optionalUser.get().getId();
            model.addAttribute("courseCount", courseRepo.countByTeacher_Id(teacherId)); // plus précis
            model.addAttribute("activeAssignments", assignmentRepo.count());
            model.addAttribute("studentCount", userRepo.countByRole("STUDENT"));
            model.addAttribute("assignments", assignmentRepo.findByCourse_Teacher_Id(teacherId));
            return "teacher/dashboard";
        } else {
            return "redirect:/login"; // utilisateur non trouvé
        }
    }
}
