package com.devoir.devoir.controller;

import com.devoir.devoir.model.Classe;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.ClasseRepository;
import com.devoir.devoir.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/teacher/classes")
public class TeacherClassController {

    @Autowired
    private ClasseRepository classeRepository;

    @Autowired
    private UserRepository userRepository;

    // ✅ Affiche la classe du professeur connecté + les étudiants
    @GetMapping
    public String showMyClasses(HttpSession session, Model model) {
        User teacher = (User) session.getAttribute("user");

        if (teacher == null || !"TEACHER".equalsIgnoreCase(teacher.getRole())) {
            return "redirect:/login";
        }

        Classe classe = teacher.getClasse();  // Classe associée au prof
        if (classe != null) {
            List<User> etudiants = userRepository.findByClasse(classe);
            model.addAttribute("classe", classe);
            model.addAttribute("etudiants", etudiants);
        }

        return "teacher/my_classes"; // /WEB-INF/views/teacher/my_classes.jsp
    }
    @GetMapping("/classes")
public String getMesClasses(Model model, Principal principal) {
    User currentUser = userRepository.findByEmail(principal.getName()).orElse(null);
    if (currentUser == null) {
        return "redirect:/login";
    }
    List<Classe> classes = classeRepository.findByResponsable(currentUser);
    model.addAttribute("classes", classes);
    return "teacher/classes"; // Crée un fichier JSP correspondant
}

}
