package com.devoir.devoir.model;

import jakarta.persistence.*;
import java.time.LocalDate;

@Entity
public class Devoir {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String titre;

    private String description;

    private LocalDate dateLimite;

    @ManyToOne
    @JoinColumn(name = "cours_id")
    private Course course; // <-- Correction ici

    // Getters et Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getTitre() { return titre; }
    public void setTitre(String titre) { this.titre = titre; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public LocalDate getDateLimite() { return dateLimite; }
    public void setDateLimite(LocalDate dateLimite) { this.dateLimite = dateLimite; }

    public Course getCourse() { return course; } // <-- Correction ici
    public void setCourse(Course course) { this.course = course; } // <-- Correction ici
}
