package group.one.service;

import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.ProblemEntity;
import group.one.entity.ProblemTagEntity;
import group.one.entity.TagEntity;

import java.util.List;

public interface ProblemTagService extends IService<ProblemTagEntity> {
    /**
     * 插入一个新的 ProblemTagEntity 记录。
     *
     * @param problemtag 要插入的 ProblemTagEntity 对象
     * @return 插入成功后返回插入的 ProblemTagEntity 对象
     */
    ProblemTagEntity insert(ProblemTagEntity problemtag);

    /**
     * 根据 ProblemTagEntity 的主键删除对应的记录。
     *
     * @param problemtag 要删除的 ProblemTagEntity 对象
     * @return 删除操作是否成功
     */
    boolean delete(ProblemTagEntity problemtag);

    /**
     * 根据问题 ID 查找与该问题关联的所有标签（ProblemTagEntity）。
     *
     * @param problemId 问题的唯一标识符
     * @return 与该问题关联的标签列表
     */
    List<ProblemTagEntity> selectByProblem(Long problemId);

    /**
     * 根据标签 ID 查找所有包含该标签的问题（ProblemEntity）。
     *
     * @param tagId 标签的唯一标识符
     * @return 包含该标签的问题列表
     */
    List<ProblemEntity> getProblemsByTagId(Long tagId);

    /**
     * 根据标签 ID 查找所有与该标签关联的 ProblemTagEntity 记录。
     *
     * @param tagId 标签的唯一标识符
     * @return 与该标签关联的 ProblemTagEntity 列表
     */
    List<ProblemTagEntity> selectByTag(Long tagId);

    /**
     * 根据问题 ID 查找与该问题关联的所有标签（TagEntity）。
     *
     * @param problemId 问题的唯一标识符
     * @return 与该问题关联的标签列表
     */
    List<TagEntity> getTagsByProblemId(Long problemId);

    /**
     * 根据标签 ID 查找所有包含该标签的问题 ID 列表。
     *
     * @param tagId 标签的唯一标识符
     * @return 包含该标签的问题 ID 列表
     */
    List<Long> getProblemIdsByTagId(Long tagId);

    /**
     * 根据问题 ID 查找与该问题关联的所有标签 ID 列表。
     *
     * @param problemId 问题的唯一标识符
     * @return 与该问题关联的标签 ID 列表
     */
    List<Long> getTagIdsByProblemId(Long problemId);

    /**
     * 根据标签 ID 和难度级别查找所有符合条件的问题标题（题干）。
     *
     * @param tagId     标签的唯一标识符
     * @param difficulty 难度级别
     * @return 符合条件的问题标题列表
     */
    List<String> getProblemTitlesByTagIdAndDifficulty(Long tagId, String difficulty);

    /**
     * 根据标签 ID 和课程 ID 查找所有符合条件的问题实体（ProblemEntity）。
     *
     * @param tagId   标签的唯一标识符
     * @param courseId 课程的唯一标识符
     * @return 符合条件的问题实体列表
     */
    List<ProblemEntity> getProblemsByTagIdAndCourseId(Long tagId, Long courseId);
}