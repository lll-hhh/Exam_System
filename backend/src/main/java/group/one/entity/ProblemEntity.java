package group.one.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("problem")
public class ProblemEntity implements Serializable {
    private static final long serialVersionUID =1L;

    @TableId(type= IdType.AUTO)
    @JsonSerialize(using = ToStringSerializer.class)

    private Long id;  // 题目ID

    private String type;  // 类型

    private String title;  // 题干

    private String description;  // 题目描述

    private String difficulty;  // 难度等级

    private Double passRate;//通过率

    private Long courseId;//课程名

    private String imgUrl;

    //还有一个选项成员

    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime createTime;

    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime modifyTime;
}

