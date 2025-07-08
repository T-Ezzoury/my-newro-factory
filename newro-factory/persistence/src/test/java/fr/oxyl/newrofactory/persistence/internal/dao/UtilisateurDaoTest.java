package fr.oxyl.newrofactory.persistence.internal.dao;

import static org.assertj.core.api.Assertions.assertThat;

import java.util.List;
import java.util.Optional;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.transaction.annotation.Transactional;

import fr.oxyl.newrofactory.persistence.config.TestPersistenceConfig;
import fr.oxyl.newrofactory.persistence.internal.entity.UserEntity;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(classes = TestPersistenceConfig.class)
@Transactional
class UtilisateurDaoTest {

    @Autowired
    private UserInternalDao utilisateurDao;

    private UserEntity user;
    private UserEntity admin;

    @BeforeEach
    void setUp() {
        user = new UserEntity();
        user.setUsername("user");
        user.setPassword("password");
        user.setRole("ROLE_USER");

        admin = new UserEntity();
        admin.setUsername("admin");
        admin.setPassword("adminpass");
        admin.setRole("ROLE_ADMIN");
    }

    @Test
    void testSaveAndFindById() {
        assertThat(utilisateurDao.findAll()).isEmpty();

        UserEntity saved = utilisateurDao.save(user);
        String id = saved.getUsername();
        assertThat(id).isEqualTo("user");

        Optional<UserEntity> retrieved = utilisateurDao.findById("user");
        assertThat(retrieved).isPresent()
                             .get()
                             .extracting(UserEntity::getPassword ,UserEntity::getAuthorities)
                             .containsExactly("password", 
                                              List.of(new SimpleGrantedAuthority("ROLE_USER")));
    }

    @Test
    void testDelete() {
        utilisateurDao.save(user);
        assertThat(utilisateurDao.existsById("user")).isTrue();

        utilisateurDao.deleteById("user");
        assertThat(utilisateurDao.existsById("user")).isFalse();
    }
}
