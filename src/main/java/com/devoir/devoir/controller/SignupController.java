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
public class SignupController {

    @Autowired
    private UserRepository userRepository;

    private final BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @GetMapping("/signup")
    public String showSignupForm() {
        return "signup";
    }

    @PostMapping("/signup")
    public String signup(@RequestParam String email,
                         @RequestParam String username,
                         @RequestParam String password,
                         @RequestParam String role,
                         HttpSession session,
                         Model model) {
        try {
            if (userRepository.findByEmail(email).isPresent()) {
                model.addAttribute("error", "Cet email est déjà utilisé.");
                return "signup";
            }

            User user = new User();
            user.setEmail(email);
            user.setUsername(username); // important
            user.setPassword(passwordEncoder.encode(password));
            user.setRole(role.toUpperCase());

            userRepository.save(user);
            return "redirect:/login?msg=Inscription réussie";

        } catch (Exception e) {
            e.printStackTrace();
            model.addAttribute("error", "Une erreur est survenue : " + e.getMessage());
            return "signup";
        }
    }
}
