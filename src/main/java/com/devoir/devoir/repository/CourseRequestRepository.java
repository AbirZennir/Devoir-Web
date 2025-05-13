package com.devoir.devoir.repository;

import com.devoir.devoir.model.CourseRequest;
import com.devoir.devoir.model.Matiere;
import com.devoir.devoir.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface CourseRequestRepository extends JpaRepository<CourseRequest, Long> {

    List<CourseRequest> findByUser(User user);

    List<CourseRequest> findByStatus(String status);

    Optional<CourseRequest> findByUserAndCourse(User user, Matiere course);

    List<CourseRequest> findByCourse(Matiere course);

    List<CourseRequest> findByUserAndStatus(User user, String status);
} 
