package group.one.dao;


import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.SchoolEntity;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface SchoolDAO extends BaseMapper<SchoolEntity> {
}
