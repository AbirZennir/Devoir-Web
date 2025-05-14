package com.devoir.devoir.model;

import jakarta.persistence.*;
import lombok.*;

import java.time.LocalDate; // ✅ IMPORTATION MANQUANTE

@Entity
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Grade {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private Double note;

    @ManyToOne
    @JoinColumn(name = "assignment_id")
    private Assignment assignment;

    @ManyToOne
    @JoinColumn(name = "student_id")
    private User student;

    @Column(name = "date_attribution")
    private LocalDate dateAttribution;
}
