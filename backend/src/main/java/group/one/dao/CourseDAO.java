package group.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.CourseEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface CourseDAO extends BaseMapper<CourseEntity> {

}
