package fr.oxyl.newrofactory.persistence.internal.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.StagiaireEntity;

@Repository
public interface StagiaireInternalDao extends PagingAndSortingRepository<StagiaireEntity, Long>,
        CrudRepository<StagiaireEntity, Long> {
    
    @Query("""
            SELECT s
            FROM StagiaireEntity s
            WHERE :search IS NULL 
                OR s.firstName LIKE CONCAT('%', :search, '%')
                OR s.lastName LIKE CONCAT('%', :search, '%')
                OR s.promotion.name LIKE CONCAT('%', :search, '%')
            """)
    Page<StagiaireEntity> findAll(@Param("search") String search, Pageable pageable);

    Optional<StagiaireEntity> findById(Long id);
}
