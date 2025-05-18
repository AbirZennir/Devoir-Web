package com.devoir.devoir.controller;

import com.devoir.devoir.repository.UserRepository;
import com.devoir.devoir.model.User;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminUserController {

    @Autowired
    private UserRepository userRepository;


    @GetMapping("/admin/users")
    public String listUsers(Model model, HttpSession session) {
        Object userId = session.getAttribute("userId");
        if (userId == null) {
            return "redirect:/login";
        }

        Iterable<User> users = userRepository.findAll();
        model.addAttribute("users", users);
        return "admin/users";
    }

    @GetMapping("/admin/users/delete/{id}")
public String deleteUser(@PathVariable Long id) {
    userRepository.deleteById(id);
    return "redirect:/admin/users";
}

@GetMapping("/admin/users/edit/{id}")
public String editUserForm(@PathVariable Long id, Model model) {
    var user = userRepository.findById(id).orElse(null);
    if (user == null) return "redirect:/admin/users";
    model.addAttribute("user", user);
    return "admin/edit_user";
}

@PostMapping("/admin/users/edit/{id}")
public String updateUser(@PathVariable Long id,
                         @RequestParam String firstName,
                         @RequestParam String lastName,
                         @RequestParam String email,
                         @RequestParam String role,
                         @RequestParam boolean active) {

    var user = userRepository.findById(id).orElse(null);
    if (user == null) return "redirect:/admin/users";

    user.setFirstName(firstName);
    user.setLastName(lastName);
    user.setEmail(email);
    user.setRole(role);
    user.setActive(active);

    userRepository.save(user);
    return "redirect:/admin/users";
}


}
