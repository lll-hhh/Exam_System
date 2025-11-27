package group.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.ExamEntity;
import group.one.entity.WrongProblemEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface WrongProblemDAO extends BaseMapper<WrongProblemEntity> {
}
