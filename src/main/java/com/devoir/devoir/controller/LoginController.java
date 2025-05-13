package com.devoir.devoir.controller;

import com.devoir.devoir.model.User;
import com.devoir.devoir.repository.UserRepository;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class LoginController {

    @Autowired
    private UserRepository userRepository;

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    // ✅ Fusion des 3 méthodes GET
    @GetMapping("/login")
    public String showLoginForm(@RequestParam(value = "logout", required = false) String logout,
                                 @RequestParam(value = "msg", required = false) String msg,
                                 Model model) {
        if (logout != null) {
            model.addAttribute("msg", "Vous avez été déconnecté avec succès.");
        }
        if (msg != null) {
            model.addAttribute("msg", msg);
        }
        return "login";
    }

    @PostMapping("/login")
    public String login(@RequestParam String email,
                        @RequestParam String password,
                        @RequestParam String role,
                        HttpSession session,
                        Model model) {

        User user = userRepository.findByEmail(email).orElse(null);

        if (user != null && passwordEncoder.matches(password, user.getPassword())) {
            if (user.getRole().equalsIgnoreCase(role)) {
                session.setAttribute("loggedInUser", user);

                switch (role.toUpperCase()) {
                    case "ADMIN":
                        return "redirect:/admin/dashboard";
                    case "TEACHER":
                        return "redirect:/teacher/dashboard";
                    case "STUDENT":
                        return "redirect:/user/dashboard";
                }
            } else {
                model.addAttribute("error", "Le rôle sélectionné ne correspond pas à votre compte.");
                return "login";
            }
        }

        model.addAttribute("error", "Email ou mot de passe incorrect.");
        return "login";
    }
}
