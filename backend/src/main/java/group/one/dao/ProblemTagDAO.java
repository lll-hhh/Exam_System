package group.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.ProblemTagEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProblemTagDAO extends BaseMapper<ProblemTagEntity> {
}
