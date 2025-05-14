package com.devoir.devoir.controller;

import com.devoir.devoir.model.Course;
import com.devoir.devoir.model.Devoir;
import com.devoir.devoir.repository.CourseRepository;
import com.devoir.devoir.repository.DevoirRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/devoirs")
public class DevoirController {

    @Autowired
    private DevoirRepository devoirRepository;

    @Autowired
    private CourseRepository courseRepository;

    @GetMapping
    public String listDevoirs(Model model) {
        List<Devoir> devoirs = devoirRepository.findAll();
        model.addAttribute("devoirs", devoirs);
        return "devoir/list";
    }

    @GetMapping("/add")
    public String showAddForm(Model model) {
        model.addAttribute("devoir", new Devoir());
        model.addAttribute("courses", courseRepository.findAll());
        return "devoir/add";
    }

    @PostMapping("/save")
    public String saveDevoir(@ModelAttribute Devoir devoir) {
        devoirRepository.save(devoir);
        return "redirect:/devoirs";
    }

    @GetMapping("/edit/{id}")
    public String showEditForm(@PathVariable Long id, Model model) {
        Devoir devoir = devoirRepository.findById(id).orElseThrow();
        model.addAttribute("devoir", devoir);
        model.addAttribute("courses", courseRepository.findAll());
        return "devoir/edit";
    }

    @PostMapping("/update")
    public String updateDevoir(@ModelAttribute Devoir devoir) {
        devoirRepository.save(devoir);
        return "redirect:/devoirs";
    }

    @GetMapping("/delete/{id}")
    public String deleteDevoir(@PathVariable Long id) {
        devoirRepository.deleteById(id);
        return "redirect:/devoirs";
    }
}
