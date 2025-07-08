package fr.oxyl.newrofactory.webapp.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.ApplicationListener;
import org.springframework.context.event.ContextRefreshedEvent;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.persistence.internal.entity.UserEntity;
import fr.oxyl.newrofactory.persistence.repository.UtilisateurRepo;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Component to initialize the first admin user on application startup
 * This is an alternative to the /init-admin endpoint and can be enabled via properties
 */
@Component
public class AdminInitializer implements ApplicationListener<ContextRefreshedEvent> {

    private static final Logger LOGGER = LoggerFactory.getLogger(AdminInitializer.class);
    
    private final UtilisateurRepo utilisateurDaoService;
    private final PasswordEncoder passwordEncoder;
    
    @Value("${admin.init.enabled:false}")
    private boolean adminInitEnabled;
    
    @Value("${admin.init.email:admin@example.com}")
    private String adminEmail;
    
    @Value("${admin.init.password:}")
    private String adminPassword;
    
    @Value("${admin.init.firstname:Admin}")
    private String adminFirstname;
    
    @Value("${admin.init.lastname:User}")
    private String adminLastname;

    public AdminInitializer(UtilisateurRepo utilisateurDaoService, PasswordEncoder passwordEncoder) {
        this.utilisateurDaoService = utilisateurDaoService;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public void onApplicationEvent(ContextRefreshedEvent event) {
        if (!adminInitEnabled) {
            LOGGER.debug("Admin initialization is disabled");
            return;
        }
        
        if (adminPassword == null || adminPassword.isEmpty()) {
            LOGGER.warn("Admin initialization is enabled but no password is set. Skipping admin creation.");
            return;
        }
        
        // Check if any admin users already exist
        boolean adminExists = false;
        Iterable<UserEntity> users = utilisateurDaoService.findAll();
        for (UserEntity user : users) {
            if (RoleConstants.ROLE_ADMIN.equals(user.getRole())) {
                adminExists = true;
                LOGGER.info("Admin user already exists, skipping initialization");
                break;
            }
        }
        
        if (adminExists) {
            return;
        }
        
        // Check if email already exists
        if (utilisateurDaoService.findById(adminEmail).isPresent()) {
            LOGGER.warn("Cannot create admin user: Email already exists: {}", adminEmail);
            return;
        }
        
        // Create admin user
        UserEntity adminUser = new UserEntity(
            adminEmail,
            passwordEncoder.encode(adminPassword),
            RoleConstants.ROLE_ADMIN,
            adminFirstname,
            adminLastname
        );
        
        // Save user
        utilisateurDaoService.save(adminUser);
        LOGGER.info("Initial admin user created successfully: {}", adminEmail);
    }
}