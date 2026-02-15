package bzs.liftcraft.model.dto;

import lombok.Builder;
import lombok.Getter;

import java.time.LocalDateTime;

@Getter
@Builder
public class WorkoutTemplateDto {
    private Long id;
    private String name;

    private Long userId;
    private String userNickname;

    private LocalDateTime createdAt;
}
