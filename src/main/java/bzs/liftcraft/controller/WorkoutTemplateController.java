package bzs.liftcraft.controller;

import bzs.liftcraft.model.dto.WorkoutTemplateDto;
import bzs.liftcraft.service.WorkoutTemplateService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/workout-template")
public class WorkoutTemplateController {
    private final WorkoutTemplateService workoutTemplateService;

    @GetMapping("/user/{userId}")
    public List<WorkoutTemplateDto> getAllForUser(@PathVariable Long userId) {
        return workoutTemplateService.getAllForUser(userId);
    }

}
