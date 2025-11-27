package group.one.entity;

import com.fasterxml.jackson.annotation.JsonPropertyOrder;
import lombok.Data;

import java.io.Serializable;
import java.util.*;
@Data
public class AnalyseUserEntity implements Serializable {
    private Long userId;
    private Long courseId;
    private Long classId;
    private Integer bestScore;
    private Integer worstScore;
    private Integer avgScore;
    private Integer avgRank;
    private Integer nearestTestRank;
    private Integer nearestTestScore;
    private Double classPassRate;
    private List<Integer> totalScores=new ArrayList<>();
    private List<Integer> totalRanks=new ArrayList<>();
    private List<String> wrongTags=new ArrayList<>();
}