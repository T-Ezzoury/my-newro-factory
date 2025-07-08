package fr.oxyl.newrofactory.service.unitaire;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

import java.util.Optional;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import fr.oxyl.newrofactory.persistence.repository.UtilisateurRepo;
import fr.oxyl.newrofactory.service.AuthentificationService;

@ExtendWith(MockitoExtension.class)
class AuthentificationServiceTest {

    @Mock
    UtilisateurRepo utilisateurDao;
    @InjectMocks  AuthentificationService service;

    // @Test
    // void loadUserByUsername_ok() {
    //     var expected = mock(UserEntity.class);
    //     when(utilisateurDao.findById("bob")).thenReturn(Optional.of(expected));

    //     var found = service.loadUserByUsername("bob");

    //     assertSame(expected, found);
    //     verify(utilisateurDao).findById("bob");
    // }

    @Test
    void loadUserByUsername_notFound() {
        when(utilisateurDao.findById("alice")).thenReturn(Optional.empty());

        assertThrows(UsernameNotFoundException.class,
                     () -> service.loadUserByUsername("alice"));
    }
}
