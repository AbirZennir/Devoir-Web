package com.devoir.devoir.controller;

import com.devoir.devoir.model.Classe;
import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.ClasseRepository;
import com.devoir.devoir.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/admin/classes")
public class AdminClasseController {

    @Autowired
    private ClasseRepository classeRepository;

    @Autowired
    private UserRepository userRepository;

    // ✅ Afficher toutes les classes
    @GetMapping
    public String listClasses(Model model) {
        List<Classe> classes = classeRepository.findAll();
        model.addAttribute("classes", classes);
        return "admin/classes"; // JSP : /WEB-INF/views/admin/classes.jsp
    }

    // ✅ Formulaire pour créer une classe
    @GetMapping("/create")
    public String showCreateForm(Model model) {
        model.addAttribute("classe", new Classe());
        model.addAttribute("professeurs", userRepository.findByRoleAndIsActive("professeur", true));
        return "admin/create_classe"; // JSP : /WEB-INF/views/admin/create_classe.jsp
    }

    // ✅ Sauvegarde d'une nouvelle classe
    @PostMapping("/save")
    public String saveClasse(@ModelAttribute("classe") Classe classe) {
        classeRepository.save(classe);
        return "redirect:/admin/classes";
    }
}
