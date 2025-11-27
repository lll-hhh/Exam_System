package group.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.ProblemEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProblemDAO extends BaseMapper<ProblemEntity> {
}
