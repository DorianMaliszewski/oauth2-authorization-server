package fr.dorianmaliszewski.oauth2authorizationserver.repositories;

import fr.dorianmaliszewski.oauth2authorizationserver.domains.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.Optional;

@Repository
public interface UserRepository extends JpaRepository<User, Long> {
    Optional<User> findByUsername(String username);
}
