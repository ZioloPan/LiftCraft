package bzs.liftcraft.controller;

import bzs.liftcraft.model.dto.ExerciseDto;
import bzs.liftcraft.service.ExerciseService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/exercise")
public class ExerciseController {
    private final ExerciseService exerciseService;

    @GetMapping("/{id}")
    public ExerciseDto getById(@PathVariable Long id) {
        return exerciseService.getById(id);
    }
}
