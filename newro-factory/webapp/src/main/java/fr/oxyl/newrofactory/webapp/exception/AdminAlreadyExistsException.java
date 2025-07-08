package fr.oxyl.newrofactory.webapp.exception;

/**
 * Exception thrown when a user tries to create an admin user when one already exists
 */
public class AdminAlreadyExistsException extends RuntimeException {
    
    private static final long serialVersionUID = 1L;
    
    public AdminAlreadyExistsException(String message) {
        super(message);
    }
}