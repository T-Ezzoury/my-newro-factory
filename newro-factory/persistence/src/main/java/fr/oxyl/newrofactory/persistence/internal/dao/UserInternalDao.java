package fr.oxyl.newrofactory.persistence.internal.dao;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import fr.oxyl.newrofactory.persistence.internal.entity.UserEntity;

@Repository
public interface UserInternalDao extends CrudRepository<UserEntity, String> {
    
}
