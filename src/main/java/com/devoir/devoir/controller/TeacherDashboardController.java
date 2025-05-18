package com.devoir.devoir.controller;

import com.devoir.devoir.model.Assignment;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.AssignmentRepository;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.SoumissionRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherDashboardController {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private AssignmentRepository assignmentRepository;

    @Autowired
    private SoumissionRepository submissionRepository;

    @GetMapping("/dashboard")
    public String dashboard(Model model, HttpSession session) {
        // ✅ Récupération depuis la session comme les autres rôles
        User user = (User) session.getAttribute("user");

        if (user == null || !"TEACHER".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login?msg=Session expirée, veuillez vous reconnecter";
        }

        Long teacherId = user.getId();

        long courseCount = courseRepository.countByTeacher_Id(teacherId);
        long activeAssignments = assignmentRepository.countByTeacher_IdAndStatus(teacherId, "pending");
        long studentCount = courseRepository.countStudentsByTeacherId(teacherId);

        List<Assignment> assignments = assignmentRepository.findTop5ByTeacher_IdOrderByDateCreationDesc(teacherId);
        for (Assignment assignment : assignments) {
            int count = (int) submissionRepository.countByDevoir_Id(assignment.getId());
            assignment.setSubmissionsCount(count);
        }

        model.addAttribute("user", user);
        model.addAttribute("courseCount", courseCount);
        model.addAttribute("activeAssignments", activeAssignments);
        model.addAttribute("studentCount", studentCount);
        model.addAttribute("assignments", assignments);

        return "teacher/dashboard";
    }
}
