package group.one.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import java.io.Serializable;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Data
@TableName("wrong_problem_set")
public class WrongProblemEntity implements Serializable {
    private static final long serialVersionUID = 1L;
    @TableId(type= IdType.AUTO)
    private Long id;
    private Long userId;
    private Long problemId;
    private String note;
    @TableField(exist = false)
    private List<Long> problemIds=new ArrayList<>();
    @TableField(exist = false)
    private List<String> wrongTags=new ArrayList<>();
    @TableField(exist = false)
    private Long courseId;
    @TableField(exist = false)
    private List<String> wrongProblemExercises=new ArrayList<>();
    @TableField(exist = false)
    private List<String> wrongProblemExercisesDesc=new ArrayList<>();
    @TableField(exist = false)
    private Integer n;
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime createTime;

    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime modifyTime;
}
