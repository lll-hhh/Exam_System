package group.one.service;

import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.ProblemTagEntity;
import group.one.entity.TagEntity;

import java.util.List;
import java.util.Map;

public interface TagService extends IService<TagEntity> {
    /**
     * 插入一个新的标签（TagEntity）。
     *
     * @param tag 要插入的标签实体
     * @return 插入成功后返回插入的标签实体
     */
    TagEntity insert(TagEntity tag);

    /**
     * 根据标签实体的主键删除对应的记录。
     *
     * @param tag 要删除的标签实体
     * @return 删除操作是否成功
     */
    boolean delete(TagEntity tag);

    /**
     * 更新一个现有的标签（TagEntity）。
     *
     * @param tag 要更新的标签实体
     * @return 更新成功后返回更新后的标签实体
     */
    TagEntity update(TagEntity tag);

    /**
     * 根据查询参数查找单个标签实体。
     *
     * @param params 查询参数，可以包含标签名称、ID 等筛选条件
     * @return 符合条件的单个标签实体，如果没有找到则返回 null
     */
    TagEntity select(Map<String, Object> params);

    /**
     * 根据多个 ProblemTagEntity 实体查找对应的标签实体列表。
     *
     * @param problemtaglist 与标签关联的 ProblemTagEntity 列表
     * @return 对应的标签实体列表
     */
    List<TagEntity> selectList(List<ProblemTagEntity> problemtaglist);

    /**
     * 根据标签名称列表获取对应的标签 ID 列表。
     *
     * @param tagNames 标签名称列表
     * @return 对应的标签 ID 列表
     */
    List<Long> getTagIdsByTagNames(List<String> tagNames);

    /**
     * 根据标签 ID 列表获取对应的标签名称列表。
     *
     * @param tagIds 标签 ID 列表
     * @return 对应的标签名称列表
     */
    List<String> getTagNamesByTagIds(List<Long> tagIds);
    /**
     * 返回所有Tag
     *
     *
     * @return 返回所有Tag
     */
    List<TagEntity> getAllTags();

    /**
     * 根据标签 ID 列表获取对应的标签列表。
     *
     * @param tagId 标签 ID 列表
     * @return 对应的标签名称列表
     */
    List<TagEntity> selectByIdList(List<Long> tagId );
}
