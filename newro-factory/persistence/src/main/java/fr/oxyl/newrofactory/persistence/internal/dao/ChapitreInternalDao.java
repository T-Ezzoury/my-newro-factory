package fr.oxyl.newrofactory.persistence.internal.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.ChapitreEntity;


@Repository
public interface ChapitreInternalDao extends PagingAndSortingRepository<ChapitreEntity, Long>, CrudRepository<ChapitreEntity, Long> {

    @Query("""
            SELECT c
            FROM ChapitreEntity c
            WHERE :search IS NULL 
                OR c.name LIKE CONCAT('%', :search, '%')
            """)
    Page<ChapitreEntity> findAll(@Param("search") String search, Pageable pageable);

    Optional<ChapitreEntity> findById(Long id);
}