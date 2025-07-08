package fr.oxyl.newrofactory.persistence.repository;

import java.util.Optional;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.persistence.internal.dao.UserInternalDao;
import fr.oxyl.newrofactory.persistence.internal.entity.UserEntity;

@Service
public class UtilisateurRepo {

    private final UserInternalDao userInternalDao;

    public UtilisateurRepo(UserInternalDao userInternalDao){
        this.userInternalDao = userInternalDao;
    }

    public Optional<? extends UserDetails> findById(String username){
        return userInternalDao.findById(username);
    }

    public UserEntity save(UserEntity user) {
        return userInternalDao.save(user);
    }

    /**
     * Find all users in the system
     * @return Iterable of UserEntity objects
     */
    public Iterable<UserEntity> findAll() {
        return userInternalDao.findAll();
    }

}
