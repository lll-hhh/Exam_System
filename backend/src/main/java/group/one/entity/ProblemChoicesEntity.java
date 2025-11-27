package group.one.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("problem_choices")
public class ProblemChoicesEntity implements Serializable {
    private static final long serialVersionUID =1L;

    @TableId(type= IdType.AUTO)
    @JsonSerialize(using = ToStringSerializer.class)
    Long id;

    @TableField(exist = false)
    private int prblemListIndex;
    
    String isAnswer;
    
    String choice;
    
    Long problemId;
    
    
    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime createTime;

    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime modifyTime;
}
