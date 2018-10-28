package pl.coderslab.meetapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.meetapp.entity.Message;


import java.util.List;


public interface MessageRepository extends JpaRepository<Message, Long> {
    List<Message> findAllBySender(Long id);
}

