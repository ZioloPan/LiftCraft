package bzs.liftcraft.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@Builder
@Entity
public class Exercise {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;
    private String description;

    @ManyToOne
    private MuscleGroup muscleGroup;

    @ManyToOne
    private Equipment equipment;

    private String photo;

    @OneToMany(mappedBy = "exercise")
    private Set<WorkoutTemplateItem> workoutTemplateItems = new HashSet<>();

    @OneToMany(mappedBy = "exercise")
    private Set<WorkoutExercise> workoutExercises = new HashSet<>();
}
