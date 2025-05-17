package com.devoir.devoir.controller;

import com.devoir.devoir.model.Assignment;
import com.devoir.devoir.model.Course;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.AssignmentRepository;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/teacher/assignments")
public class TeacherAssignmentController {

    @Autowired
    private AssignmentRepository assignmentRepository;

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping
    public String listAssignments(Model model, HttpSession session,
                                  @RequestParam(defaultValue = "0") int page) {
        Long teacherId = (Long) session.getAttribute("userId");
        if (teacherId == null) return "redirect:/login?msg=Session expirée";

        Pageable pageable = PageRequest.of(page, 5);
        Page<Assignment> assignments = assignmentRepository.findByTeacher_Id(teacherId, pageable);
        model.addAttribute("assignments", assignments.getContent());
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", assignments.getTotalPages());
        return "teacher/assignments";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model, HttpSession session) {
        Long teacherId = (Long) session.getAttribute("userId");
        if (teacherId == null) return "redirect:/login";

        List<Course> courses = courseRepository.findByTeacher_Id(teacherId);
        model.addAttribute("courses", courses);
        model.addAttribute("assignment", new Assignment());
        return "teacher/create_assignment";
    }

    @PostMapping("/create")
    public String createAssignment(@ModelAttribute Assignment assignment, HttpSession session) {
        Long teacherId = (Long) session.getAttribute("userId");
        if (teacherId == null) return "redirect:/login";

        User teacher = userRepository.findById(teacherId).orElse(null);
        if (teacher == null) return "redirect:/login";

        assignment.setTeacher(teacher);
        assignment.setDateCreation(LocalDate.now());
        assignment.setStatus("pending");
        assignmentRepository.save(assignment);
        return "redirect:/teacher/assignments";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model, HttpSession session) {
        Assignment assignment = assignmentRepository.findById(id).orElse(null);
        if (assignment == null) return "redirect:/teacher/assignments";

        Long teacherId = (Long) session.getAttribute("userId");
        if (teacherId == null || !assignment.getTeacher().getId().equals(teacherId)) {
            return "redirect:/login";
        }

        model.addAttribute("assignment", assignment);
        model.addAttribute("courses", courseRepository.findByTeacher_Id(teacherId));
        return "teacher/edit_assignment";
    }

    @PostMapping("/edit/{id}")
    public String updateAssignment(@PathVariable Long id, @ModelAttribute Assignment updatedAssignment, HttpSession session) {
        Assignment assignment = assignmentRepository.findById(id).orElse(null);
        if (assignment == null) return "redirect:/teacher/assignments";

        assignment.setTitre(updatedAssignment.getTitre());
        assignment.setDescription(updatedAssignment.getDescription());
        assignment.setDeadline(updatedAssignment.getDeadline());
        assignment.setCourse(updatedAssignment.getCourse());
        assignmentRepository.save(assignment);
        return "redirect:/teacher/assignments";
    }

    @PostMapping("/delete/{id}")
    public String deleteAssignment(@PathVariable Long id, HttpSession session) {
        Assignment assignment = assignmentRepository.findById(id).orElse(null);
        if (assignment == null) return "redirect:/teacher/assignments";

        Long teacherId = (Long) session.getAttribute("userId");
        if (teacherId == null || !assignment.getTeacher().getId().equals(teacherId)) {
            return "redirect:/login";
        }

        assignmentRepository.delete(assignment);
        return "redirect:/teacher/assignments";
    }
}
