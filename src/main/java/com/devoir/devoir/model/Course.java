package com.devoir.devoir.model;

import jakarta.persistence.*;
import lombok.*;

import java.util.List;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;
    private String description;

    @ManyToOne
    @JoinColumn(name = "teacher_id")
    private User teacher;

    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL)
    private List<Assignment> assignments;

    @ManyToMany
    @JoinTable(
        name = "course_student",
        joinColumns = @JoinColumn(name = "course_id"),
        inverseJoinColumns = @JoinColumn(name = "student_id")
    )
    private List<User> students;

    @Override
    public String toString() {
        return "Course{" +
                "id=" + id +
                ", nom='" + nom + '\'' +
                ", description='" + description + '\'' +
                ", teacher=" + (teacher != null ? teacher.getId() : null) +
                '}';
    }
}
