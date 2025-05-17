package com.devoir.devoir.repository;

import com.devoir.devoir.model.Classe;
import com.devoir.devoir.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ClasseRepository extends JpaRepository<Classe, Long> {
    Classe findByNom(String nom);
    List<Classe> findByResponsable(User responsable);
    List<Classe> findByResponsable_Id(Long responsableId);
}
