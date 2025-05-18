package com.devoir.devoir.controller;

import com.devoir.devoir.model.Classe;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.ClasseRepository;
import com.devoir.devoir.repository.UserRepository;
import com.devoir.devoir.repository.CourseRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/admin/classes")
public class AdminClasseController {

    @Autowired
    private ClasseRepository classeRepository;
    @Autowired
    private UserRepository userRepository;

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping
    public String listClasses(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user"); // ✅ Injection de l'utilisateur
        model.addAttribute("user", user);

        List<Classe> classes = classeRepository.findAll();
        model.addAttribute("classes", classes);
        return "admin/classes";
    }

    @GetMapping("/create")
    public String showCreateForm(Model model, HttpSession session) {
        User user = (User) session.getAttribute("user");
        model.addAttribute("user", user);

        model.addAttribute("classe", new Classe());
        model.addAttribute("professeurs", userRepository.findByRoleAndIsActive("TEACHER", true));
        model.addAttribute("etudiants", userRepository.findByRoleAndIsActive("STUDENT", true));
        model.addAttribute("courses", courseRepository.findAll()); 
        return "admin/create_classe";
    }

    @PostMapping("/save")
    public String saveClasse(@ModelAttribute("classe") Classe classe,
                             @RequestParam("professeurId") Long professeurId,
                             @RequestParam(value = "etudiantIds", required = false) List<Long> etudiantIds) {

        User professeur = userRepository.findById(professeurId).orElse(null);
        classe.setResponsable(professeur);

        List<User> etudiants = new ArrayList<>();
        if (etudiantIds != null) {
            etudiants = userRepository.findAllById(etudiantIds);
            for (User etudiant : etudiants) {
                etudiant.setClasse(classe);
            }
        }

        classeRepository.save(classe);
        userRepository.saveAll(etudiants);

        return "redirect:/admin/classes";
    }
}
