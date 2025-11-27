package group.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.LogicalPaperEntity;
import group.one.entity.PaperEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PaperDAO extends BaseMapper<PaperEntity> {
}

