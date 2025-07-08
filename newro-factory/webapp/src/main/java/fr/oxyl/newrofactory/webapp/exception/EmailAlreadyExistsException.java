package fr.oxyl.newrofactory.webapp.exception;

/**
 * Exception thrown when a user tries to register with an email that already exists
 */
public class EmailAlreadyExistsException extends RuntimeException {
    
    private static final long serialVersionUID = 1L;
    
    public EmailAlreadyExistsException(String message) {
        super(message);
    }
}