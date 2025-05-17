package com.devoir.devoir.controller;

import com.devoir.devoir.model.Soumission;
import com.devoir.devoir.repository.SoumissionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class NoterSoumissionController {

    @Autowired
    private SoumissionRepository soumissionRepository;

    @PostMapping("/teacher/noter")
    public String noterSoumission(@RequestParam Long soumissionId,
                                  @RequestParam int note,
                                  @RequestParam String commentaireProf,
                                  RedirectAttributes redirectAttributes) {

        Soumission s = soumissionRepository.findById(soumissionId).orElse(null);
        if (s != null) {
            s.setNote(note);
            s.setCommentaireProf(commentaireProf);
            s.setStatut("NOTE");
            soumissionRepository.save(s);
            redirectAttributes.addFlashAttribute("success", "Note enregistrée avec succès.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Soumission introuvable.");
        }

        return "redirect:/teacher/notes";
    }
}
