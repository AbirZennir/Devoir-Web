package com.devoir.devoir.repository;

import com.devoir.devoir.model.Devoir;
import org.springframework.data.jpa.repository.JpaRepository;

public interface DevoirRepository extends JpaRepository<Devoir, Long> {
}
