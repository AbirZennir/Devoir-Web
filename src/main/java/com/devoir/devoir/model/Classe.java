package com.devoir.devoir.model;

import jakarta.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "classes")
public class Classe {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String nom;

    private String niveau;

    // ✅ Propriété manquante à ajouter
    private String description;

    @ManyToOne
    @JoinColumn(name = "responsable_id")
    private User responsable;

    @OneToMany(mappedBy = "classe", cascade = CascadeType.ALL)
    private List<User> etudiants;
@ManyToMany
@JoinTable(name = "classe_courses",
    joinColumns = @JoinColumn(name = "classe_id"),
    inverseJoinColumns = @JoinColumn(name = "course_id"))
private Set<Course> courses;
// Getters and setters  
    public Set<Course> getCourses() {
        return courses;
    }
    public void setCourses(Set<Course> courses) {
        this.courses = courses;
    }
    // Getters & Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getNiveau() {
        return niveau;
    }

    public void setNiveau(String niveau) {
        this.niveau = niveau;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getResponsable() {
        return responsable;
    }

    public void setResponsable(User responsable) {
        this.responsable = responsable;
    }

    public List<User> getEtudiants() {
        return etudiants;
    }

    public void setEtudiants(List<User> etudiants) {
        this.etudiants = etudiants;
    }
}
