package fr.oxyl.newrofactory.persistence.internal.dao;

import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.QuestionEntity;

@Repository
public interface QuestionInternalDao extends PagingAndSortingRepository<QuestionEntity, Long>, CrudRepository<QuestionEntity, Long> {
    @Query("""

                SELECT q
            FROM QuestionEntity q
            WHERE :search IS NULL 
                OR q.title LIKE CONCAT('%', :search, '%')
                OR q.statement LIKE CONCAT('%', :search, '%')
            """)
    Page<QuestionEntity> findAll(@Param("search") String search, Pageable pageable);

    Optional<QuestionEntity> findById(long id);
}