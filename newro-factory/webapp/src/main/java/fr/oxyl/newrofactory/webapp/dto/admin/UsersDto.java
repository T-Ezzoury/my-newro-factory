package fr.oxyl.newrofactory.webapp.dto.admin;

import java.util.List;

/**
 * DTO for a collection of users, used in admin operations
 */
public record UsersDto(
    List<UserDto> users
) {}