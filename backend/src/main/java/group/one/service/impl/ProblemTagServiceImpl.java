package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.ProblemTagDAO;
import group.one.entity.ProblemEntity;
import group.one.entity.ProblemTagEntity;
import group.one.entity.TagEntity;
import group.one.service.ProblemService;
import group.one.service.ProblemTagService;
import group.one.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.stream.Collectors;


@Service("problemtagService")
public class ProblemTagServiceImpl extends ServiceImpl<ProblemTagDAO, ProblemTagEntity>
        implements ProblemTagService {
    @Autowired
    public ProblemService problemService;
    @Autowired
    public TagService tagService;

    @Override
    @Transactional
    public ProblemTagEntity insert(ProblemTagEntity problemtag) {
        save(problemtag);
        return problemtag;
    }

    @Override
    @Transactional
    public boolean delete(ProblemTagEntity problemtag) {
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery()
                .eq(ProblemTagEntity::getProblemId, problemtag.getProblemId())
                .eq(ProblemTagEntity::getTagId, problemtag.getTagId());

        // 尝试找到并删除实体
        return remove(wrapper);
    }

    @Override
    @Transactional
    public List<ProblemTagEntity> selectByProblem(Long problemid) {
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery();
        wrapper.eq(ProblemTagEntity::getProblemId, problemid);

        // 执行查询
        return list(wrapper);
    }

    @Override
    @Transactional
    public List<TagEntity> getTagsByProblemId(Long problemId) {
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery()
                .eq(problemId != null, ProblemTagEntity::getProblemId, problemId);

        List<ProblemTagEntity> problemTagList = list(wrapper);

        return tagService.selectList(problemTagList);
    }

    @Override
    @Transactional
    public List<ProblemTagEntity> selectByTag(Long tagid){
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery();
        wrapper.eq(ProblemTagEntity::getTagId, tagid);

        // 执行查询
        return list(wrapper);
    }

    @Override
    @Transactional
    public List<ProblemEntity> getProblemsByTagId(Long tagId) {
        // 第一步：查询所有与 tagId 关联的 ProblemTagEntity
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery()
                .eq(tagId != null, ProblemTagEntity::getTagId, tagId);

        List<ProblemTagEntity> problemTagList = list(wrapper);

        return problemService.selectList(problemTagList);

    }

    @Override
    @Transactional
    public List<Long> getProblemIdsByTagId(Long tagId){
        // 第一步：查询所有与 tagId 关联的 ProblemTagEntity
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery()
                .eq(tagId != null, ProblemTagEntity::getTagId, tagId);

        List<ProblemTagEntity> problemTagList = list(wrapper);
        List<Long> problemIds = problemTagList.stream()
                .map(ProblemTagEntity::getProblemId) // 假设 ProblemTagEntity 有一个名为 getProblemId 的方法来获取 problemId
                .distinct() // 如果需要去除重复的 problemId，可以使用 distinct 方法
                .collect(Collectors.toList()); // 收集结果到 List<Long>

        return problemIds;
    }

    @Override
    @Transactional
    public List<Long> getTagIdsByProblemId(Long problemId){
        // 第一步：查询所有与 tagId 关联的 ProblemTagEntity
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery()
                .eq(problemId != null, ProblemTagEntity::getProblemId, problemId);

        List<ProblemTagEntity> problemTagList = list(wrapper);
        List<Long> tagIds = problemTagList.stream()
                .map(ProblemTagEntity::getProblemId) // 假设 ProblemTagEntity 有一个名为 get tagId 的方法来获取  tagId
                .distinct() // 如果需要去除重复的  tagId，可以使用 distinct 方法
                .collect(Collectors.toList()); // 收集结果到 List<Long>

        return  tagIds;
    }

    @Override
    @Transactional
    public List<String> getProblemTitlesByTagIdAndDifficulty(Long tagId,String difficulty) {
        // 第一步：查询所有与 tagId 关联的 ProblemTagEntity
        LambdaQueryWrapper<ProblemTagEntity> wrapper = Wrappers.<ProblemTagEntity>lambdaQuery()
                .eq(tagId != null, ProblemTagEntity::getTagId, tagId);

        List<ProblemTagEntity> problemTagList = list(wrapper);

        // 第二步：从 problemTagList 中提取所有的 problemId，并将它们放入一个新的 List<Long> 中
        List<Long> problemIds = problemTagList.stream()
                .map(ProblemTagEntity::getProblemId) // 假设 ProblemTagEntity 有一个名为 getProblemId 的方法来获取 problemId
                .distinct() // 如果需要去除重复的 problemId，可以使用 distinct 方法
                .collect(Collectors.toList());

        // 第三步：根据 problemIds 和 difficulty 查询对应的 ProblemEntity 列表
        List<ProblemEntity> problems = problemService.selectByIdListAndDifficulty(problemIds, difficulty);

        // 第四步：从 problems 中提取所有的 title，并将它们放入一个新的 List<String> 中
        List<String> problemTitles = problems.stream()
                .map(ProblemEntity::getTitle) // 假设 ProblemEntity 有一个名为 getTitle 的方法来获取 title
                .distinct() // 如果需要去除重复的 title，可以使用 distinct 方法
                .collect(Collectors.toList());

        return problemTitles; // 返回问题标题列表
    }

    @Override
    @Transactional
    public List<ProblemEntity> getProblemsByTagIdAndCourseId(Long tagId,Long courseId){
        List<ProblemTagEntity> problemTagEntityList=selectByTag(tagId);
        List<Long> problemIds = problemTagEntityList.stream()
                .map(ProblemTagEntity::getProblemId) // 假设 ProblemEntity 有一个名为 getTitle 的方法来获取 title
                .collect(Collectors.toList());

        List<ProblemEntity> problemEntityList=problemService.selectByProblemIdListAndCourseId(problemIds,courseId);
        return problemEntityList;
    }

}
