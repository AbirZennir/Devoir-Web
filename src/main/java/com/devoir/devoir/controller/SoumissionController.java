package com.devoir.devoir.controller;

import com.devoir.devoir.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.StandardCopyOption;

@Controller
public class SoumissionController {

    @Value("${upload.directory:uploads}")
    private String uploadDir;

    @PostMapping("/user/soumettre")
    public String handleSoumission(@RequestParam("file") MultipartFile file,
                                   @RequestParam("commentaire") String commentaire,
                                   @RequestParam("devoirId") Long devoirId,
                                   HttpSession session,
                                   RedirectAttributes redirectAttributes,
                                   Model model) {
        
        User user = (User) session.getAttribute("loggedInUser");
        if (user == null) {
            return "redirect:/login?msg=Session expirée.";
        }

        try {
            // 📁 Créer le répertoire si nécessaire
            File uploadPath = new File(uploadDir);
            if (!uploadPath.exists()) {
                uploadPath.mkdirs();
            }

            // 📄 Créer un nom unique pour le fichier
            String filename = System.currentTimeMillis() + "_" + file.getOriginalFilename();
            Path filePath = Path.of(uploadPath.getAbsolutePath(), filename);
            Files.copy(file.getInputStream(), filePath, StandardCopyOption.REPLACE_EXISTING);

            // ✅ Enregistrement simulé (à remplacer par DAO/service)
            System.out.println("Soumission de devoir ID: " + devoirId);
            System.out.println("Par étudiant ID: " + user.getId());
            System.out.println("Fichier: " + filename);
            System.out.println("Commentaire: " + commentaire);

            redirectAttributes.addFlashAttribute("success", "Devoir soumis avec succès.");

        } catch (IOException e) {
            model.addAttribute("error", "Erreur lors de l'envoi du fichier : " + e.getMessage());
            return "user/soumettre";
        }

        return "redirect:/user/devoirs";
    }
}
