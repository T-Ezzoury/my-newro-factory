package fr.oxyl.newrofactory.service;

import java.time.Instant;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import javax.crypto.SecretKey;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;

import fr.oxyl.newrofactory.core.constants.RoleConstants;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.security.Keys;

@Service
public class JwtService {

    private final long validitySeconds;
    private final SecretKey secretKey;

    public JwtService(
            @Value("${jwt.secretKey}") String secretHash,
            @Value("${jwt.expirationTime}") long validitySeconds) {
        this.validitySeconds = validitySeconds;
        this.secretKey = Keys.hmacShaKeyFor(secretHash.getBytes());
    }

    /**
     * Generate a token for a user based on their role
     * @param user The user details
     * @return A JWT token
     */
    public String generateToken(UserDetails user) {
        // Check if the user has admin role
        boolean isAdmin = user.getAuthorities().stream()
                .anyMatch(auth -> RoleConstants.ROLE_ADMIN.equals(auth.getAuthority()));

        if (isAdmin) {
            return generateAdminToken(user);
        } else {
            return generateUserToken(user);
        }
    }

    /**
     * Generate a token for a regular user
     * @param user The user details
     * @return A JWT token for regular users
     */
    private String generateUserToken(UserDetails user) {
        Instant now = Instant.now();
        Instant exp = now.plusSeconds(validitySeconds);

        return Jwts.builder()
                .subject(user.getUsername())
                .claim("roles",
                        user.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()))
                .claim("tokenType", "USER")
                .issuedAt(Date.from(now))
                .expiration(Date.from(exp))
                .signWith(secretKey, Jwts.SIG.HS256)
                .compact();
    }

    /**
     * Generate a token for an admin user
     * @param user The user details
     * @return A JWT token for admin users
     */
    private String generateAdminToken(UserDetails user) {
        Instant now = Instant.now();
        Instant exp = now.plusSeconds(validitySeconds);

        return Jwts.builder()
                .subject(user.getUsername())
                .claim("roles",
                        user.getAuthorities().stream().map(GrantedAuthority::getAuthority).collect(Collectors.toList()))
                .claim("tokenType", "ADMIN")
                .issuedAt(Date.from(now))
                .expiration(Date.from(exp))
                .signWith(secretKey, Jwts.SIG.HS256)
                .compact();
    }

    public boolean isValid(String token) {
        try {
            getParser().parseSignedClaims(token);
            return true;
        } catch (JwtException jwtException) {
            return false;
        }

    }

    public Authentication toAuthentication(String token) {
        Claims claims = getParser()
                .parseSignedClaims(token)
                .getPayload();
        String username = claims.getSubject();

        @SuppressWarnings("unchecked")
        var roles = ((List<String>) claims.get("roles"))
                .stream()
                .map(SimpleGrantedAuthority::new)
                .collect(Collectors.toList());

        return new UsernamePasswordAuthenticationToken(username, null, roles);
    }

    public String extractUsername(String token) {
        try {
            return getParser()
                    .parseSignedClaims(token)
                    .getPayload()
                    .getSubject();
        } catch (JwtException e) {
            return null;
        }
    }

    private JwtParser getParser() {
        return Jwts.parser().verifyWith(secretKey).build();
    }

}
