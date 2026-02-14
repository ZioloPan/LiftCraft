package bzs.liftcraft.mapper;

import bzs.liftcraft.model.Exercise;
import bzs.liftcraft.model.dto.ExerciseDto;
import lombok.experimental.UtilityClass;

@UtilityClass
public class ExerciseMapper {

    public ExerciseDto mapToDto(Exercise exercise) {
        return ExerciseDto.builder()
                .id(exercise.getId())
                .name(exercise.getName())
                .description(exercise.getDescription())
                .muscleGroupTag(exercise.getMuscleGroup().getTag())
                .muscleGroupName(exercise.getMuscleGroup().getName())
                .equipmentTag(exercise.getEquipment().getTag())
                .equipmentName(exercise.getEquipment().getName())
                .photo(exercise.getPhoto())
                .build();
    }
}
