package group.one.entity;

import com.baomidou.mybatisplus.annotation.*;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import com.fasterxml.jackson.databind.ser.std.ToStringSerializer;
import lombok.Data;

import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@TableName("paper")
public class PaperEntity implements Serializable {
    private static final long serialVersionUID=1l;

    @TableId(type = IdType.AUTO)
    @JsonSerialize(using= ToStringSerializer.class)
    private Long id;
    private Long logicalPaperId;

    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime createTime;

    @JsonFormat(pattern ="yyyy-MM-dd HH:mm:ss")
    @TableField(fill= FieldFill.INSERT)
    private LocalDateTime modifyTime;
}
