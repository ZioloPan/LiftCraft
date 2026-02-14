package bzs.liftcraft.repository;

import bzs.liftcraft.model.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ExerciseRepository  extends JpaRepository<Exercise, Long> {
}
