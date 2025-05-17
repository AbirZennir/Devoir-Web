package com.devoir.devoir.controller;

import com.devoir.devoir.model.Classe;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.ClasseRepository;
import com.devoir.devoir.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import java.security.Principal;
import java.util.List;

@Controller
public class TeacherCourseController {

    private final ClasseRepository classeRepository;
    private final UserRepository userRepository;

    public TeacherCourseController(ClasseRepository classeRepository, UserRepository userRepository) {
        this.classeRepository = classeRepository;
        this.userRepository = userRepository;
    }

    // 🔴 On change ici le mapping pour éviter le conflit
    @GetMapping("/teacher/my-classes")  // ⚠️ Changer ce chemin
    public String viewMyClasses(HttpSession session, Model model) {
        User currentUser = (User) session.getAttribute("loggedInUser");
        List<Classe> myClasses = classeRepository.findAll()
                .stream()
                .filter(classe -> classe.getResponsable().getId().equals(currentUser.getId()))
                .toList();

        model.addAttribute("classes", myClasses);
        return "teacher/courses.jsp";
    }

    // ❗Ce mapping est déjà correct (différent)
    @GetMapping("/my-classes")
    public String showMyClasses(Model model, Principal principal) {
        User teacher = userRepository.findByEmail(principal.getName()).orElse(null);
        if (teacher == null) {
            return "redirect:/login";
        }
        List<Classe> classes = classeRepository.findByResponsable(teacher);
        model.addAttribute("classes", classes);
        return "teacher/my_classes";
    }
}
