package com.devoir.devoir.model;

import jakarta.persistence.*;
import java.util.List;

@Entity
public class Cours {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;

    @OneToMany(mappedBy = "cours", cascade = CascadeType.ALL)
    private List<Devoir> devoirs;

    // Getters et Setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }

    public String getNom() { return nom; }
    public void setNom(String nom) { this.nom = nom; }

    public List<Devoir> getDevoirs() { return devoirs; }
    public void setDevoirs(List<Devoir> devoirs) { this.devoirs = devoirs; }
}
