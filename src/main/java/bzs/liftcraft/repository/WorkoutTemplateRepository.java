package bzs.liftcraft.repository;

import bzs.liftcraft.model.WorkoutTemplate;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface WorkoutTemplateRepository extends JpaRepository<WorkoutTemplate, Long> {
    List<WorkoutTemplate> findAllByUser_Id(Long userId);

    Optional<WorkoutTemplate> findByIdAndUser_Id(Long id, Long userId);
}
