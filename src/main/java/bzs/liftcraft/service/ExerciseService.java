package bzs.liftcraft.service;

import bzs.liftcraft.mapper.ExerciseMapper;
import bzs.liftcraft.model.dto.ExerciseDto;
import bzs.liftcraft.repository.ExerciseRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class ExerciseService {

    private final ExerciseRepository exerciseRepository;

    public ExerciseDto getById(Long id) {
        return exerciseRepository.findById(id)
                .map(ExerciseMapper::mapToDto)
                .orElseThrow(() -> new RuntimeException("Exercise not found: " + id));
    }

    public List<ExerciseDto> getAll(String equipmentTag, String muscleGroupTag) {
        var exercises =
                (equipmentTag != null && !equipmentTag.isBlank() && muscleGroupTag != null && !muscleGroupTag.isBlank())
                        ? exerciseRepository.findAllByEquipment_TagAndMuscleGroup_Tag(equipmentTag, muscleGroupTag)
                        : (equipmentTag != null && !equipmentTag.isBlank())
                        ? exerciseRepository.findAllByEquipment_Tag(equipmentTag)
                        : (muscleGroupTag != null && !muscleGroupTag.isBlank())
                        ? exerciseRepository.findAllByMuscleGroup_Tag(muscleGroupTag)
                        : exerciseRepository.findAll();

        return exercises.stream()
                .map(ExerciseMapper::mapToDto)
                .toList();
    }
}
