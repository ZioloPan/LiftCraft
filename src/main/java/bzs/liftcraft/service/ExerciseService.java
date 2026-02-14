package bzs.liftcraft.service;

import bzs.liftcraft.mapper.ExerciseMapper;
import bzs.liftcraft.model.dto.ExerciseDto;
import bzs.liftcraft.repository.ExerciseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class ExerciseService {

    private final ExerciseRepository exerciseRepository;

    public ExerciseDto getById(Long id) {
        return exerciseRepository.findById(id)
                .map(ExerciseMapper::mapToDto)
                .orElseThrow(() -> new RuntimeException("Exercise not found: " + id));
    }
}
