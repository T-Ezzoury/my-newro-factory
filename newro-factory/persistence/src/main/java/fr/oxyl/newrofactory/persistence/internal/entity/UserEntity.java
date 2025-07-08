package fr.oxyl.newrofactory.persistence.internal.entity;
import java.util.Collection;
import java.util.List;

import org.springframework.lang.NonNull;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name = "user")
public class UserEntity implements UserDetails {

    private static final long serialVersionUID = 1L;

    @Id
    @Column(name = "email")
    String username; // Used to store email

    @Column(name = "password", nullable = false)
    String password;

    @Column(name = "role", nullable = false)
    String role;

    @Column(name = "first_name", nullable = false)
    String firstname;

    @Column(name = "last_name", nullable = false)
    String lastname;

    public UserEntity() {
    }

    public UserEntity(String username, @NonNull String password, @NonNull String role) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.firstname = "";
        this.lastname = "";
    }

    public UserEntity(String username, @NonNull String password, @NonNull String role, 
                     @NonNull String firstname, @NonNull String lastname) {
        this.username = username;
        this.password = password;
        this.role = role;
        this.firstname = firstname;
        this.lastname = lastname;
    }

    public void setUsername(@NonNull String username) {
        this.username = username;
    }

    @Override
    public String getUsername() {
        return username;
    }

    public void setPassword(@NonNull String password) {
        this.password = password;
    }

    @Override
    public String getPassword() {
        return password;
    }

    public void setRole(@NonNull String role) {
        this.role = role;
    }

    public String getRole() {
        return role;
    }

    public void setFirstname(@NonNull String firstname) {
        this.firstname = firstname;
    }

    public String getFirstname() {
        return firstname;
    }

    public void setLastname(@NonNull String lastname) {
        this.lastname = lastname;
    }

    public String getLastname() {
        return lastname;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return List.of(new SimpleGrantedAuthority(role));
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((username == null) ? 0 : username.hashCode());
        result = prime * result + ((password == null) ? 0 : password.hashCode());
        result = prime * result + ((role == null) ? 0 : role.hashCode());
        result = prime * result + ((firstname == null) ? 0 : firstname.hashCode());
        result = prime * result + ((lastname == null) ? 0 : lastname.hashCode());
        return result;
    }

    @Override
    public boolean equals(Object obj) {
        if (this == obj)
            return true;
        if (obj == null)
            return false;
        if (getClass() != obj.getClass())
            return false;
        UserEntity other = (UserEntity) obj;
        if (username == null) {
            if (other.username != null)
                return false;
        } else if (!username.equals(other.username))
            return false;
        if (password == null) {
            if (other.password != null)
                return false;
        } else if (!password.equals(other.password))
            return false;
        if (role == null) {
            if (other.role != null)
                return false;
        } else if (!role.equals(other.role))
            return false;
        if (firstname == null) {
            if (other.firstname != null)
                return false;
        } else if (!firstname.equals(other.firstname))
            return false;
        if (lastname == null) {
            if (other.lastname != null)
                return false;
        } else if (!lastname.equals(other.lastname))
            return false;
        return true;
    }

    @Override
    public String toString() {
        return "UtilisateurEntity [username=" + username + ", password=" + password + ", role=" + role 
                + ", firstname=" + firstname + ", lastname=" + lastname + "]";
    }

}
