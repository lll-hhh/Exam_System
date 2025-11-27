package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.CourseDAO;
import group.one.entity.CourseEntity;
import group.one.entity.ProblemEntity;
import group.one.service.CourseService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Map;


@Service("courseService")
public class CourseServiceImpl extends ServiceImpl<CourseDAO,CourseEntity>
        implements CourseService {

    @Override
    @Transactional
    public CourseEntity insert(CourseEntity course){
        save(course);
        return course;
    }
    @Override
    @Transactional
    public boolean delete(CourseEntity course){
        if(!ObjectUtils.isEmpty(course.getId())){
            removeById(course.getId());
            return true;
        }
        return false;
    }
    @Override
    @Transactional
    public CourseEntity update(CourseEntity course){
        if (!ObjectUtils.isEmpty(course.getId())){
            updateById(course);
        }
        return course;
    }
    @Override
    @Transactional
    public CourseEntity select(Map<String,Object> params) {
        // 创建分页对象
        LambdaQueryWrapper<CourseEntity> query = Wrappers.lambdaQuery();
        query.eq(CourseEntity::getId, params.get("id"));

        return getOne(query);
    }

    @Override
    @Transactional
    public Long getCourseIdByName(String courseName){
        LambdaQueryWrapper<CourseEntity> wrapper =Wrappers.<CourseEntity>lambdaQuery()
                .eq(CourseEntity::getCourseName,courseName);
        CourseEntity courseEntity =getOne(wrapper);
        Long courseId =courseEntity.getId();
        return courseId;
    }
    @Override
    @Transactional
    public List<CourseEntity> getAllCourse(){
        LambdaQueryWrapper<CourseEntity> wrapper = Wrappers.<CourseEntity>lambdaQuery();
        List<CourseEntity> allTags = list(wrapper);
        return allTags;
    }
}
