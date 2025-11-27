package group.one.entity;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Data;

import java.io.Serializable;
import java.util.*;

@Data
public class ExerciseEntity implements Serializable {
    private Long userId;
    private Long courseId;
    private String difficulty;
    private List<String> exercises=new ArrayList<>();
    private List<String> descriptions=new ArrayList<>();
    private String upperBound;
    private String lowerBound;
    private Integer n;
}
