package pl.coderslab.meetapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import pl.coderslab.meetapp.entity.Comment;

import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {

    List<Comment> findAllByMeetId(Long id);

}
