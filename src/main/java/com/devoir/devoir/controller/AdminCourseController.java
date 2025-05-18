package com.devoir.devoir.controller;

import com.devoir.devoir.repository.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class AdminCourseController {

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping("/admin/courses")
    public String listCourses(Model model) {
        model.addAttribute("courses", courseRepository.findAll());
        return "admin/courses"; // => Crée le fichier JSP : admin/courses.jsp
    }
}
