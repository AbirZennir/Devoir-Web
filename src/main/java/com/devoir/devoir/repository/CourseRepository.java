package com.devoir.devoir.repository;

import com.devoir.devoir.model.Course;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CourseRepository extends JpaRepository<Course, Long> {

    Long countByTeacher_Id(Long teacherId); // fonctionne car Course a bien "User teacher"

}
