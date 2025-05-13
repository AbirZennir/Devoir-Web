package com.devoir.devoir.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
@Table(name = "course_requests")
public class CourseRequest {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "user_id")
    private User user;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "course_id")
    private Matiere course;

    private String status; // PENDING, ACCEPTED, REJECTED

    @Temporal(TemporalType.TIMESTAMP)
    @Column(name = "created_at")
    private Date createdAt;

    @PrePersist
    protected void onCreate() {
        this.createdAt = new Date();
        this.status = "PENDING";
    }

    // Getters & Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Matiere getCourse() {
        return course;
    }

    public void setCourse(Matiere course) {
        this.course = course;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    public CourseRequest(User user, Matiere course) {
        this.user = user;
        this.course = course;
        this.status = "PENDING";
        this.createdAt = new Date();
    }
    public CourseRequest() {
        // Constructeur par défaut
    }
    
} 
