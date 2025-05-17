package com.devoir.devoir.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDateTime;

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Soumission {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String fichier;
    private String commentaire;
    private String commentaireProf;
    private int note;
    private String statut;
    private LocalDateTime dateSoumission;

    @ManyToOne
    @JoinColumn(name = "devoir_id")
    private Assignment devoir;

    @ManyToOne
    @JoinColumn(name = "etudiant_id")
    private User etudiant;

    public void setNote(int note) {
    this.note = note;
}

public void setCommentaireProf(String commentaireProf) {
    this.commentaireProf = commentaireProf;
}

public void setStatut(String statut) {
    this.statut = statut;
}

}
