package fr.oxyl.newrofactory.webapp.exception;

/**
 * Exception thrown when passwords do not match during registration
 */
public class PasswordMismatchException extends RuntimeException {
    
    private static final long serialVersionUID = 1L;
    
    public PasswordMismatchException(String message) {
        super(message);
    }
}