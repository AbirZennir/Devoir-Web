package com.devoir.devoir.repository;

import com.devoir.devoir.model.Classe;
import com.devoir.devoir.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.Optional;
import java.util.List;
import org.springframework.data.jpa.repository.Query;

public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByEmailAndPassword(String email, String password);
    Optional<User> findByEmail(String email);
    Long countByRole(String role);
    List<User> findByRole(String role);
    List<User> findByRoleAndIsActive(String role, Boolean isActive);
List<User> findByClasse(Classe classe);
}