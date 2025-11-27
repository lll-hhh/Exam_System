package group.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.TagEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface TagDAO extends BaseMapper<TagEntity> {
}
