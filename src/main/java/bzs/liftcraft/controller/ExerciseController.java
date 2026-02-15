package bzs.liftcraft.controller;

import bzs.liftcraft.model.dto.ExerciseDto;
import bzs.liftcraft.service.ExerciseService;
import lombok.RequiredArgsConstructor;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@RequiredArgsConstructor
@RequestMapping("/api/v1/exercise")
public class ExerciseController {
    private final ExerciseService exerciseService;

    @GetMapping
    public List<ExerciseDto> getAll(
            @RequestParam(required = false) String equipment,
            @RequestParam(required = false) String muscleGroup
    ) {
        return exerciseService.getAll(equipment, muscleGroup);
    }

    @GetMapping("/{id}")
    public ExerciseDto getById(@PathVariable Long id) {
        return exerciseService.getById(id);
    }
}
