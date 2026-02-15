package bzs.liftcraft.service;

import bzs.liftcraft.mapper.WorkoutTemplateMapper;
import bzs.liftcraft.model.dto.WorkoutTemplateDto;
import bzs.liftcraft.repository.UserRepository;
import bzs.liftcraft.repository.WorkoutTemplateRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class WorkoutTemplateService {

    private final WorkoutTemplateRepository workoutTemplateRepository;
    private final UserRepository userRepository;

    public List<WorkoutTemplateDto> getAllForUser(Long userId) {
        return workoutTemplateRepository.findAllByUser_Id(userId).stream()
                .map(WorkoutTemplateMapper::mapToDto)
                .toList();
    }


}
