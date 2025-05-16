// AssignmentRepository.java
package com.devoir.devoir.repository;

import com.devoir.devoir.model.Assignment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface AssignmentRepository extends JpaRepository<Assignment, Long> {

    List<Assignment> findByStudent_Id(Long studentId);

    List<Assignment> findByTeacher_Id(Long teacherId);

    List<Assignment> findByCourse_Teacher_Id(Long teacherId);

    Long countByStudent_Id(Long studentId);

    long countByTeacher_IdAndStatus(Long teacherId, String status); // ✅ requis

    List<Assignment> findTop5ByTeacher_IdOrderByDateCreationDesc(Long teacherId); // ✅ requis

    @Query("SELECT COUNT(a) FROM Assignment a WHERE a.status = 'submitted'")
    Long countSubmitted();

    @Query(value = "SELECT COUNT(*) FROM assignment WHERE EXTRACT(MONTH FROM date_creation) = EXTRACT(MONTH FROM CURRENT_DATE)", nativeQuery = true)
    Long countByMonth();

    @Query("SELECT COUNT(a) FROM Assignment a WHERE a.student.id = :studentId AND a.status = 'submitted'")
    Long countSubmittedByStudentId(@Param("studentId") Long studentId);

    @Query("SELECT COUNT(a) FROM Assignment a WHERE a.student.id = :studentId AND a.status = 'pending'")
    Long countPendingByStudentId(@Param("studentId") Long studentId);
}
