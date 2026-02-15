package bzs.liftcraft.mapper;

import bzs.liftcraft.model.WorkoutTemplate;
import bzs.liftcraft.model.dto.WorkoutTemplateDto;

import lombok.experimental.UtilityClass;

@UtilityClass
public class WorkoutTemplateMapper {

    public WorkoutTemplateDto mapToDto(WorkoutTemplate template) {
        return WorkoutTemplateDto.builder()
                .id(template.getId())
                .name(template.getName())
                .userId(template.getUser().getId())
                .userNickname(template.getUser().getNickname())
                .createdAt(template.getCreatedAt())
                .build();
    }
}
