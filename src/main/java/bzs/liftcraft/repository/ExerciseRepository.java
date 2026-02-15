package bzs.liftcraft.repository;

import bzs.liftcraft.model.Exercise;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ExerciseRepository  extends JpaRepository<Exercise, Long> {
    List<Exercise> findAllByEquipment_Tag(String equipmentTag);

    List<Exercise> findAllByMuscleGroup_Tag(String muscleGroupTag);

    List<Exercise> findAllByEquipment_TagAndMuscleGroup_Tag(String equipmentTag, String muscleGroupTag);
}
