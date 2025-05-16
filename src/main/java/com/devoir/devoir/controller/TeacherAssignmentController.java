package com.devoir.devoir.controller;

import com.devoir.devoir.model.Assignment;
import com.devoir.devoir.model.Course;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.AssignmentRepository;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/enseignant/assignments")
public class TeacherAssignmentController {

    @Autowired
    private AssignmentRepository assignmentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    // ✅ Formulaire de création
    @GetMapping("/create")
    public String showCreateForm(Model model, HttpSession session) {
        Long teacherId = (Long) session.getAttribute("userId");

        if (teacherId == null) {
            return "redirect:/login?msg=Session expirée, veuillez vous reconnecter";
        }

        List<Course> courses = courseRepository.findByTeacher_Id(teacherId);
        model.addAttribute("courses", courses);
        model.addAttribute("assignment", new Assignment());
        return "teacher/create_assignment";
    }

    // ✅ Enregistrement de l'affectation
    @PostMapping("/create")
    public String createAssignment(@ModelAttribute Assignment assignment, HttpSession session) {
        Long teacherId = (Long) session.getAttribute("userId");

        if (teacherId == null) {
            return "redirect:/login?msg=Session expirée, veuillez vous reconnecter";
        }

        User teacher = userRepository.findById(teacherId).orElse(null);
        if (teacher == null) {
            return "redirect:/login?msg=Utilisateur introuvable";
        }

        assignment.setTeacher(teacher);
        assignment.setDateCreation(LocalDate.now());
        assignment.setStatus("pending");

        assignmentRepository.save(assignment);
        return "redirect:/teacher/dashboard";
    }
}
