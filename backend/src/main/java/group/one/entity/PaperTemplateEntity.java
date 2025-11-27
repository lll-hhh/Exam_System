package group.one.entity;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.util.LinkedList;

@Data
public class PaperTemplateEntity implements Serializable {
    private static final long serialVersionUID=1l;
    @JsonSerialize(using= ToStringSerializer.class)
    private Integer paperNum;
    private Integer totalScore;
    private Integer choiceNum;
    private Integer choiceScore;
    private Integer judgeNum;
    private Integer judgeScore;
    private Integer blankfillingNum;
    private Integer blankfillingScore;
    private Integer shortanswerNum;
    private Integer shortanswerScore;
    private String[] tagNameList;
    private Double difficultyExpectations;
    private Double passRateExpectations;
    private String course;
}
