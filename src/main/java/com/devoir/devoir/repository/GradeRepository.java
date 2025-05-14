package com.devoir.devoir.repository;

import com.devoir.devoir.model.Grade;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface GradeRepository extends JpaRepository<Grade, Long> {

     @Query(value = "SELECT COUNT(*) FROM grade WHERE TO_CHAR(date_attribution, 'MM') = TO_CHAR(CURRENT_DATE, 'MM')", nativeQuery = true)
Long countByMonth();


    Long countByStudent_Id(Long studentId);
}

