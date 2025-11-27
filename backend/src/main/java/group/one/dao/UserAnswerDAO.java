package group.one.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.UserAnswerEntity;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserAnswerDAO extends BaseMapper<UserAnswerEntity> {
}
