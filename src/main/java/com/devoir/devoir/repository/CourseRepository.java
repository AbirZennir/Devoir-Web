package com.devoir.devoir.repository;

import com.devoir.devoir.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface CourseRepository extends JpaRepository<Course, Long> {

    List<Course> findByTeacher_Id(Long teacherId);

    long countByTeacher_Id(Long teacherId); // Utilisable directement

    @Query("SELECT COUNT(DISTINCT s.id) FROM Course c JOIN c.students s WHERE c.teacher.id = :teacherId")
    long countStudentsByTeacherId(@Param("teacherId") Long teacherId);
}
