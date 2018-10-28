package pl.coderslab.meetapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.meetapp.entity.User;


public interface UserRepository extends JpaRepository<User, Long> {

    User findByUsername(String username);
    User findByEmail(String email);
    User getUserIdByUsername(String username);
}
