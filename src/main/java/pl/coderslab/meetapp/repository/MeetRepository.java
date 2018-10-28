package pl.coderslab.meetapp.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import pl.coderslab.meetapp.entity.Meet;


import java.util.List;

public interface MeetRepository extends JpaRepository<Meet, Long> {


    List<Meet> findAllByUserId(Long id);

    List<Meet> findAllByCity(String city);

    List<Meet> findAllByCategory(String category);


    @Query("SELECT m FROM Meet m WHERE m.category LIKE :search% ORDER BY m.created DESC")
    List<Meet> findBySearch(@Param("search") String search);

    @Query("SELECT m FROM Meet m WHERE m.city LIKE :search1% ORDER BY m.created DESC")
    List<Meet> findBySearchCity(@Param("search1") String search1);
}
