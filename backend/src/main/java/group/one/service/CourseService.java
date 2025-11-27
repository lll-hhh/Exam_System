package group.one.service;

import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.CourseEntity;
import group.one.entity.ProblemEntity;

import java.util.List;
import java.util.Map;

public interface CourseService extends IService<CourseEntity> {
    /**
     * 插入一个新的课程（CourseEntity）。
     *
     * @param course 要插入的课程实体
     * @return 插入成功后返回插入的课程实体
     */
    CourseEntity insert(CourseEntity course);

    /**
     * 根据课程实体的主键删除对应的记录。
     *
     * @param course 要删除的课程实体
     * @return 删除操作是否成功
     */
    boolean delete(CourseEntity course);

    /**
     * 更新一个现有的课程（CourseEntity）。
     *
     * @param course 要更新的课程实体
     * @return 更新成功后返回更新后的课程实体
     */
    CourseEntity update(CourseEntity course);

    /**
     * 分页查询课程列表，支持根据多个条件进行筛选。
     *
     * @param params 查询参数，可以包含分页信息和其他筛选条件（如课程名称、创建时间等）
     * @return 包含分页信息的课程实体列表
     */
    CourseEntity select(Map<String, Object> params);

    /**
     * 通过课程名获取课程 ID。
     *
     * @param courseName 课程的名称
     * @return 对应的课程 ID，如果没有找到则返回 null
     */
    Long getCourseIdByName(String courseName);
    /**
     * 返回所有课程
     *
     *
     * @return 返回所有课程
     */
    List<CourseEntity> getAllCourse();
}
