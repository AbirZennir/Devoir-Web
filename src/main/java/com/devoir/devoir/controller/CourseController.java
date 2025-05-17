package com.devoir.devoir.controller;

import com.devoir.devoir.model.Course;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/teacher/courses")
public class CourseController {

    @Autowired
    private CourseRepository courseRepository;

    @Autowired
    private UserRepository userRepository;

    // 🔹 Affichage des cours de l'enseignant
    @GetMapping
    public String listCourses(Model model, HttpSession session) {
        Long teacherId = (Long) session.getAttribute("userId");
        if (teacherId == null) return "redirect:/login";

        List<Course> courses = courseRepository.findByTeacher_Id(teacherId);
        model.addAttribute("courses", courses);
        return "teacher/courses";
    }

    // 🔹 Affichage formulaire de création
    @GetMapping("/create")
    public String showCreateCourseForm(Model model) {
        model.addAttribute("course", new Course());
        return "teacher/create_course";
    }

    // 🔹 Enregistrement du cours
    @PostMapping("/create")
    public String createCourse(@ModelAttribute Course course, HttpSession session) {
        Long teacherId = (Long) session.getAttribute("userId");
        if (teacherId == null) return "redirect:/login";

        User teacher = userRepository.findById(teacherId).orElse(null);
        if (teacher == null) return "redirect:/login";

        course.setTeacher(teacher);
        courseRepository.save(course);
        return "redirect:/teacher/courses";
    }
}
