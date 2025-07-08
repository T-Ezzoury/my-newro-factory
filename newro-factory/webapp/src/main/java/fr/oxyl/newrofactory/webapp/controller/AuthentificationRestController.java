package fr.oxyl.newrofactory.webapp.controller;

import org.springframework.web.bind.annotation.*;

import fr.oxyl.newrofactory.webapp.exception.AdminAlreadyExistsException;
import fr.oxyl.newrofactory.webapp.exception.EmailAlreadyExistsException;
import fr.oxyl.newrofactory.webapp.exception.PasswordMismatchException;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import fr.oxyl.newrofactory.persistence.internal.entity.UserEntity;
import fr.oxyl.newrofactory.persistence.repository.UtilisateurRepo;
import fr.oxyl.newrofactory.service.JwtService;
import fr.oxyl.newrofactory.webapp.dto.auth.LoginRequest;
import fr.oxyl.newrofactory.webapp.dto.auth.RegisterRequest;
import fr.oxyl.newrofactory.webapp.dto.auth.TokenJwt;
import jakarta.validation.Valid;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.password.PasswordEncoder;

@RestController
@RequestMapping("/api/authentification")
@CrossOrigin(origins = "http://localhost:4200", allowedHeaders = "*", allowCredentials = "true", exposedHeaders = "Authorization")
public class AuthentificationRestController {

    private static final Logger LOGGER = LoggerFactory.getLogger(AuthentificationRestController.class);

    private final AuthenticationManager authenticationManager;
    private final JwtService jwtService;
    private final UtilisateurRepo utilisateurDaoService;
    private final PasswordEncoder passwordEncoder;

    public AuthentificationRestController(AuthenticationManager authenticationManager,
                                          JwtService jwtService, UtilisateurRepo utilisateurDaoService, PasswordEncoder passwordEncoder) {
        this.authenticationManager = authenticationManager;
        this.jwtService = jwtService;
        this.utilisateurDaoService = utilisateurDaoService;
        this.passwordEncoder = passwordEncoder;
    }

    @PostMapping("/login")
    public TokenJwt authentification(@Valid @RequestBody LoginRequest loginRequest) {
        LOGGER.debug("Login attempt with email: {}", loginRequest.email());
        Authentication authentication = authenticationManager.authenticate(
                new UsernamePasswordAuthenticationToken(loginRequest.email(), loginRequest.password()));

        UserEntity user = (UserEntity) authentication.getPrincipal();
        String jwt = jwtService.generateToken(user);

        // Determine token type based on user role
        String tokenType = RoleConstants.ROLE_ADMIN.equals(user.getRole()) ? "ADMIN" : "USER";

        return new TokenJwt(
            jwt,
            user.getUsername(), // Email is stored in username field
            user.getFirstname(),
            user.getLastname(),
            user.getRole(),
            tokenType
        );
    }

    @PostMapping("/register")
    public TokenJwt register(@Valid @RequestBody RegisterRequest registerRequest) {
        LOGGER.debug("Registration attempt with email: {}, firstname: {}, lastname: {}", 
                registerRequest.email(), registerRequest.firstname(), registerRequest.lastname());

        // Check if passwords match
        if (!registerRequest.password().equals(registerRequest.confirmPassword())) {
            throw new PasswordMismatchException("Passwords do not match");
        }

        // Check if email already exists
        if (utilisateurDaoService.findById(registerRequest.email()).isPresent()) {
            throw new EmailAlreadyExistsException("Email already exists: " + registerRequest.email());
        }

        // Always assign USER role for regular registration
        // Admin users can only be created through the admin endpoint
        UserEntity newUser = new UserEntity(
            registerRequest.email(),
            passwordEncoder.encode(registerRequest.password()),
            RoleConstants.ROLE_USER, // Force USER role regardless of what was requested
            registerRequest.firstname(),
            registerRequest.lastname()
        );

        // Save user
        utilisateurDaoService.save(newUser);

        // Generate JWT token
        String jwt = jwtService.generateToken(newUser);

        // For register, it's always a USER token
        String tokenType = "USER";

        return new TokenJwt(
            jwt,
            newUser.getUsername(), // Email is stored in username field
            newUser.getFirstname(),
            newUser.getLastname(),
            newUser.getRole(),
            tokenType
        );
    }

    /**
     * Response for admin initialization
     */
    private static class AdminInitResponse {
        private final String message;
        private final String email;
        private final String role;

        public AdminInitResponse(String message, String email, String role) {
            this.message = message;
            this.email = email;
            this.role = role;
        }

        public String getMessage() {
            return message;
        }

        public String getEmail() {
            return email;
        }

        public String getRole() {
            return role;
        }
    }

    /**
     * Special endpoint to create the first admin user
     * This endpoint is publicly accessible but will only work if no admin users exist yet
     */
    @PostMapping("/init-admin")
    public ResponseEntity<?> initializeAdmin(@Valid @RequestBody RegisterRequest registerRequest) {
        LOGGER.debug("Attempt to initialize admin user with email: {}", registerRequest.email());

        // Check if passwords match
        if (!registerRequest.password().equals(registerRequest.confirmPassword())) {
            throw new PasswordMismatchException("Passwords do not match");
        }

        // Check if email already exists
        if (utilisateurDaoService.findById(registerRequest.email()).isPresent()) {
            throw new EmailAlreadyExistsException("Email already exists: " + registerRequest.email());
        }

        // Check if any admin users already exist
        boolean adminExists = false;
        Iterable<UserEntity> users = utilisateurDaoService.findAll();
        for (UserEntity user : users) {
            if (RoleConstants.ROLE_ADMIN.equals(user.getRole())) {
                adminExists = true;
                LOGGER.warn("Admin user already exists, cannot create another admin through this endpoint");
                break;
            }
        }

        if (adminExists) {
            throw new AdminAlreadyExistsException("Admin user already exists. Use the admin panel to create additional admins.");
        }

        // Create admin user
        UserEntity adminUser = new UserEntity(
            registerRequest.email(),
            passwordEncoder.encode(registerRequest.password()),
            RoleConstants.ROLE_ADMIN,
            registerRequest.firstname(),
            registerRequest.lastname()
        );

        // Save user
        utilisateurDaoService.save(adminUser);
        LOGGER.info("Initial admin user created successfully: {}", registerRequest.email());

        // Return success response with user info
        return new ResponseEntity<>(
            new AdminInitResponse(
                "Admin user created successfully",
                adminUser.getUsername(),
                adminUser.getRole()
            ),
            HttpStatus.CREATED
        );
    }

    /**
     * Standardized error response for authentication errors
     */
    private static class AuthErrorResponse {
        private final String error;
        private final String message;

        public AuthErrorResponse(String error, String message) {
            this.error = error;
            this.message = message;
        }

        public String getError() {
            return error;
        }

        public String getMessage() {
            return message;
        }
    }

    /**
     * Handle authentication exceptions
     */
    @ExceptionHandler(org.springframework.security.core.AuthenticationException.class)
    public ResponseEntity<AuthErrorResponse> handleAuthenticationException(org.springframework.security.core.AuthenticationException e) {
        LOGGER.warn("Authentication failed: {}", e.getMessage());
        return new ResponseEntity<>(
            new AuthErrorResponse("authentication_failed", "Invalid email or password"),
            HttpStatus.UNAUTHORIZED
        );
    }

    /**
     * Handle validation exceptions
     */
    @ExceptionHandler(org.springframework.web.bind.MethodArgumentNotValidException.class)
    public ResponseEntity<AuthErrorResponse> handleValidationException(org.springframework.web.bind.MethodArgumentNotValidException e) {
        String errorMessage = e.getBindingResult().getFieldErrors().stream()
            .map(error -> error.getField() + ": " + error.getDefaultMessage())
            .findFirst()
            .orElse("Validation error");

        LOGGER.warn("Validation failed: {}", errorMessage);
        return new ResponseEntity<>(
            new AuthErrorResponse("validation_error", errorMessage),
            HttpStatus.BAD_REQUEST
        );
    }

    /**
     * Handle general exceptions
     */
    @ExceptionHandler(Exception.class)
    public ResponseEntity<AuthErrorResponse> handleGeneralException(Exception e) {
        LOGGER.error("Unexpected error during authentication: {}", e.getMessage(), e);
        return new ResponseEntity<>(
            new AuthErrorResponse("server_error", "An unexpected error occurred"),
            HttpStatus.INTERNAL_SERVER_ERROR
        );
    }

    /**
     * Handle specific runtime exceptions thrown in our code
     */
    @ExceptionHandler(RuntimeException.class)
    public ResponseEntity<AuthErrorResponse> handleRuntimeException(RuntimeException e) {
        LOGGER.warn("Runtime exception: {}", e.getMessage());
        return new ResponseEntity<>(
            new AuthErrorResponse("request_error", e.getMessage()),
            HttpStatus.BAD_REQUEST
        );
    }

    /**
     * Handle password mismatch exceptions
     */
    @ExceptionHandler(PasswordMismatchException.class)
    public ResponseEntity<AuthErrorResponse> handlePasswordMismatchException(PasswordMismatchException e) {
        LOGGER.warn("Password mismatch: {}", e.getMessage());
        return new ResponseEntity<>(
            new AuthErrorResponse("password_mismatch", e.getMessage()),
            HttpStatus.BAD_REQUEST
        );
    }

    /**
     * Handle email already exists exceptions
     */
    @ExceptionHandler(EmailAlreadyExistsException.class)
    public ResponseEntity<AuthErrorResponse> handleEmailAlreadyExistsException(EmailAlreadyExistsException e) {
        LOGGER.warn("Email already exists: {}", e.getMessage());
        return new ResponseEntity<>(
            new AuthErrorResponse("email_exists", e.getMessage()),
            HttpStatus.BAD_REQUEST
        );
    }

    /**
     * Handle admin already exists exceptions
     */
    @ExceptionHandler(AdminAlreadyExistsException.class)
    public ResponseEntity<AuthErrorResponse> handleAdminAlreadyExistsException(AdminAlreadyExistsException e) {
        LOGGER.warn("Admin already exists: {}", e.getMessage());
        return new ResponseEntity<>(
            new AuthErrorResponse("admin_exists", e.getMessage()),
            HttpStatus.FORBIDDEN
        );
    }


}
