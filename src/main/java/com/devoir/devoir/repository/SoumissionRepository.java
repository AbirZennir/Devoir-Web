package com.devoir.devoir.repository;

import com.devoir.devoir.model.Soumission;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface SoumissionRepository extends JpaRepository<Soumission, Long> {
    List<Soumission> findByEtudiant_Id(Long etudiantId);
    List<Soumission> findByDevoir_Id(Long devoirId);
}
