package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.TagDAO;
import group.one.entity.ProblemTagEntity;
import group.one.entity.TagEntity;
import group.one.service.TagService;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


import java.util.Collections;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service("tagService")
public class TagServiceImpl extends ServiceImpl<TagDAO, TagEntity>
        implements TagService {
    @Override
    @Transactional
    public TagEntity insert(TagEntity tag){
        save(tag);
        return tag;
    }
    @Override
    @Transactional
    public boolean delete(TagEntity tag){
        if(!ObjectUtils.isEmpty(tag.getId())){
            removeById(tag.getId());
            return true;
        }
        return false;
    }
    @Override
    @Transactional
    public TagEntity update(TagEntity tag){
         updateById(tag);
        return tag;
    }
    @Override
    @Transactional
    public TagEntity select(Map<String,Object> params) {
        LambdaQueryWrapper<TagEntity> query = Wrappers.lambdaQuery();
        query.eq(TagEntity::getId, params.get("id"));

        return getOne(query);
    }
    @Override
    @Transactional
    public List<TagEntity> selectList(List<ProblemTagEntity> problemtaglist){
        List<Long> tagIds = problemtaglist.stream()
                .map(ProblemTagEntity::getTagId)
                .distinct()  // 确保唯一性
                .collect(Collectors.toList());

        LambdaQueryWrapper<TagEntity> tagWrapper = Wrappers.<TagEntity>lambdaQuery()
                .in(!tagIds.isEmpty(), TagEntity::getId, tagIds);

        return list(tagWrapper);
    }

    @Override
    @Transactional(readOnly = true) // 只读事务，提高性能
    public List<Long> getTagIdsByTagNames(List<String> tagNames) {
        if (tagNames == null || tagNames.isEmpty()) {
            return Collections.emptyList(); // 如果为空或 null，直接返回空列表
        }

        // 使用 MyBatis Plus 的 LambdaQueryWrapper 构造查询条件
        LambdaQueryWrapper<TagEntity> wrapper = Wrappers.<TagEntity>lambdaQuery()
                .in(TagEntity::getTagName, tagNames); // 应该匹配 name 字段

        // 执行查询并获取结果
        List<TagEntity> tagEntities = list(wrapper);

        // 从 tagEntities 中提取所有的 id，并将它们放入一个新的 List<Long> 中
        List<Long> tagIds = tagEntities.stream()
                .map(TagEntity::getId) // 确保 getId 返回 Long 类型
                .distinct() // 去重，防止可能的重复项
                .collect(Collectors.toList());

        return tagIds;
    }

    @Override
    @Transactional(readOnly = true) // 只读事务，提高性能
    public List<String> getTagNamesByTagIds(List<Long> tagIds){
        if (tagIds == null || tagIds.isEmpty()) {
            return Collections.emptyList(); // 如果为空或 null，直接返回空列表
        }

        // 使用 MyBatis Plus 的 LambdaQueryWrapper 构造查询条件
        LambdaQueryWrapper<TagEntity> wrapper = Wrappers.<TagEntity>lambdaQuery()
                .in(TagEntity::getId, tagIds); // in 表示 id 在给定的 tagIds 中

        // 执行查询并获取结果
        List<TagEntity> tagEntities = list(wrapper);
        return tagEntities.stream()
                .map(TagEntity::getTagName) // 假设 TagEntity 有一个名为 getName 的方法来获取 name
                .distinct() // 去重，防止可能的重复项
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public List<TagEntity> getAllTags() {
        LambdaQueryWrapper<TagEntity> wrapper = Wrappers.<TagEntity>lambdaQuery();
        List<TagEntity> allTags = list(wrapper);
        return allTags;
    }


    @Override
    @Transactional
    public List<TagEntity> selectByIdList(List<Long> tagId ){
        LambdaQueryWrapper<TagEntity> wrapper=Wrappers.<TagEntity>lambdaQuery()
                .in(TagEntity::getId,tagId);
        return list(wrapper);
    }

}
