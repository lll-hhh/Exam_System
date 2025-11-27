package group.one.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;
import java.io.Serializable;

@Data
@TableName("problem_tag")
public class ProblemTagEntity implements Serializable {
    private static final long serialVersionUID =1L;

    @TableId(type= IdType.AUTO)
    @JsonSerialize(using = ToStringSerializer.class)
    private Long id;
    private Long problemId;
    private Long tagId;
}

