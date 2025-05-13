package com.devoir.devoir.controller;

import com.devoir.devoir.model.Cours;
import com.devoir.devoir.model.Devoir;
import com.devoir.devoir.repository.CoursRepository;
import com.devoir.devoir.repository.DevoirRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDate;
import java.util.List;

@Controller
@RequestMapping("/devoirs")
public class DevoirController {

    @Autowired
    private DevoirRepository devoirRepository;

    @Autowired
    private CoursRepository coursRepository;

    // Afficher le formulaire
    @GetMapping("/create")
    public String showCreateForm(Model model, HttpSession session) {
        // TODO: filtrer les cours selon l'enseignant connecté si nécessaire
        List<Cours> coursList = coursRepository.findAll();
        model.addAttribute("coursList", coursList);
        return "teacher/create_devoir";
    }

    // Soumettre le formulaire
    @PostMapping("/create")
    public String createDevoir(@RequestParam String titre,
                               @RequestParam String description,
                               @RequestParam String deadline,
                               @RequestParam Long coursId,
                               HttpSession session) {

        Cours cours = coursRepository.findById(coursId).orElse(null);
        if (cours == null) {
            return "redirect:/teacher/dashboard?error=cours";
        }

        Devoir devoir = new Devoir();
        devoir.setTitre(titre);
        devoir.setDescription(description);
        devoir.setDateLimite(LocalDate.parse(deadline));
        devoir.setCours(cours);

        devoirRepository.save(devoir);
        return "redirect:/teacher/dashboard";
    }
}
