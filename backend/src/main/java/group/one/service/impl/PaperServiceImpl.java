package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.PaperDAO;
import group.one.entity.PaperEntity;
import group.one.entity.ProblemEntity;
import group.one.service.LogicalPaperService;
import group.one.service.PaperProblemService;
import group.one.service.PaperService;
import group.one.service.ProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service("PaperService")
public class PaperServiceImpl extends ServiceImpl<PaperDAO,PaperEntity> implements PaperService {
    @Autowired
    private LogicalPaperService logicalPaperService;
    @Autowired
    @Lazy
    private PaperProblemService paperProblemService;
    @Autowired
    @Lazy
    private ProblemService problemService;
    @Override
    public PaperEntity getById(Long id) {
        LambdaQueryWrapper<PaperEntity> query = Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(id),PaperEntity::getId,id);
        return baseMapper.selectOne(query);
    }
    @Override
    public Long getCourseId(Long id) {
        LambdaQueryWrapper<PaperEntity> query = Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(id),PaperEntity::getId,id);
        PaperEntity paperEntity=baseMapper.selectOne(query);
        Long logicalPaperId=paperEntity.getLogicalPaperId();
        return logicalPaperService.getById(logicalPaperId).getCourseId();
    }

    @Override
    public List<Long> getPaperIdsByCourseId(Long courseId) {
        List<Long> logicalPaperIds = logicalPaperService.getLogicalPaperIdsByCourseId(courseId);
        if (logicalPaperIds.isEmpty()) {
            return Collections.emptyList(); // 没有逻辑试卷，就直接返回空列表
        }
        LambdaQueryWrapper<PaperEntity> query = Wrappers.lambdaQuery();
        query.in(PaperEntity::getLogicalPaperId, logicalPaperIds);
        List<PaperEntity> papers = baseMapper.selectList(query);
        return papers.stream().map(PaperEntity::getId).collect(Collectors.toList());
    }

    @Override
    public PaperEntity storePaper(PaperEntity paper) {
        baseMapper.insert(paper);
        return paper;
    }
    @Override
    public List<PaperEntity> storePaperList(List<PaperEntity> paperList)
    {
        for(PaperEntity paper:paperList)
        {
            baseMapper.insert(paper);
        }
        return paperList;
    }
    @Override
    public IPage<PaperEntity> listAll(Integer curPage, Integer limit) {
        LambdaQueryWrapper<PaperEntity> query=Wrappers.lambdaQuery();
        query.orderByDesc(PaperEntity::getId);
        return baseMapper.selectPage(new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(curPage,limit),query);
    }

    @Override
    public List<PaperEntity> getPapersByLogicalId(Long logicalPaperId) {
        LambdaQueryWrapper<PaperEntity> query=Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(logicalPaperId),PaperEntity::getLogicalPaperId,logicalPaperId);
        query.orderByDesc(PaperEntity::getCreateTime);
        List<PaperEntity> papers = baseMapper.selectList(query);
        return papers;
    }
    @Override
    public PaperEntity deleteById(Long id)
    {
        LambdaQueryWrapper<PaperEntity> query = Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(id),PaperEntity::getId,id);
        PaperEntity paperEntity=getById(id);
        // 创建一个新的PaperEntity对象并设置id
        baseMapper.deleteById(query);
        return paperEntity;
    }
    @Override
    public List<ProblemEntity> browsePaper(Long id)
    {
        PaperEntity paper=getById(id);
        List<Long> problemIds= paperProblemService.getProblemIdsByPaperId(id);
        List<ProblemEntity> problems = problemService.selectByIdList(problemIds);

        // 创建一个Map存储每个problemId在problemIds列表中的索引
        Map<Long, Integer> problemIdIndexMap = new HashMap<>();
        for (int i = 0; i < problemIds.size(); i++) {
            problemIdIndexMap.put(problemIds.get(i), i);
        }
        // 使用Comparator对problems列表进行排序
        problems.sort(Comparator.comparingInt(problem -> problemIdIndexMap.get(problem.getId())));
        return problems;
    }
}
