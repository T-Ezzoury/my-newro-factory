package fr.oxyl.newrofactory.webapp.dto.admin;

/**
 * DTO for user information, used in admin operations
 */
public record UserDto(
    String email,
    String firstname,
    String lastname,
    String role
) {}