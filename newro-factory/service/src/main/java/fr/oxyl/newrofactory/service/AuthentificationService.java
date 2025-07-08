package fr.oxyl.newrofactory.service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.persistence.repository.UtilisateurRepo;


@Service
public class AuthentificationService implements UserDetailsService {

    private final UtilisateurRepo utilisateurDao;

    public AuthentificationService(UtilisateurRepo utilisateurDao) {
        this.utilisateurDao = utilisateurDao;
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        return utilisateurDao.findById(username).orElseThrow(() -> 
            new UsernameNotFoundException("Utilisateur non trouvé : " + username));
    }
    
}
