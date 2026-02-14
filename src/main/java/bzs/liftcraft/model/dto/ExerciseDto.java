package bzs.liftcraft.model.dto;

import lombok.Builder;
import lombok.Getter;

@Getter
@Builder
public class ExerciseDto {

    private Long id;
    private String name;
    private String description;
    private String muscleGroupTag;
    private String muscleGroupName;
    private String equipmentTag;
    private String equipmentName;
    private String photo;
}
