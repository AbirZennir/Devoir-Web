package com.devoir.devoir.model;

import jakarta.persistence.*;
import lombok.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "auth_tokens")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class AuthToken {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(unique = true, nullable = false)
    private String token;

    @Column(nullable = false)
    private String tokenType = "BEARER"; // BEARER, REFRESH

    @Column(columnDefinition = "BOOLEAN DEFAULT FALSE")
    private Boolean expired = false;

    @Column(columnDefinition = "BOOLEAN DEFAULT FALSE")
    private Boolean revoked = false;

    @Column(nullable = false)
    private LocalDateTime expiresAt;

    @Column(updatable = false)
    private LocalDateTime createdAt = LocalDateTime.now();

    // Relations
    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;
}
