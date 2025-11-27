package group.one.service.impl;

import                                                                                                  com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.PaperProblemDAO;
import group.one.entity.PaperEntity;
import group.one.entity.PaperProblemEntity;
import group.one.service.PaperProblemService;
import group.one.service.PaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service("PaperProblemService")

public class PaperProblemServiceImpl extends ServiceImpl<PaperProblemDAO, PaperProblemEntity>implements PaperProblemService {
    @Autowired
    PaperService paperService;
    @Override
    public List<Long> getProblemIdsByPaperId(Long paperId) {
        List<Long> problemIds=new ArrayList<>();
        LambdaQueryWrapper<PaperProblemEntity> query= Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(paperId),PaperProblemEntity::getPaperId,paperId);
        query.orderByAsc(PaperProblemEntity::getProblemOrder);

        List<PaperProblemEntity> paperProblemEntities=baseMapper.selectList(query);
        for(PaperProblemEntity paperProblemEntity: paperProblemEntities)
        {
            problemIds.add(paperProblemEntity.getProblemId());
        }
        return problemIds;
    }
    @Override
    public Long getPointByPaperIdAndProblemId(Long paperId,Long problemId)
    {
        LambdaQueryWrapper<PaperProblemEntity> query= Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(paperId),PaperProblemEntity::getPaperId,paperId);
        query.eq(ObjectUtils.isNotEmpty(problemId), PaperProblemEntity::getProblemId, problemId);

        PaperProblemEntity entity = baseMapper.selectOne(query);
        if (entity!= null) {
            return entity.getPoint();
        }
        return null;
    }

    @Override
    public PaperEntity storePaperWithLogicalId(Long logicalPaperId, PaperEntity paper) {
        paper.setLogicalPaperId(logicalPaperId);
        paperService.storePaper(paper);
        return paper;
    }
    @Override
    public PaperProblemEntity store(PaperProblemEntity paperProblemEntity)
    {
        baseMapper.insert(paperProblemEntity);
        return paperProblemEntity;
    }
    @Override
    public List<Long> getProblemIdsByLogicalPaperId(Long logicalPaperId) {
        List<PaperEntity> papers=paperService.getPapersByLogicalId(logicalPaperId);
        Long paperId=papers.get(0).getId();
        LambdaQueryWrapper<PaperProblemEntity> query= Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(paperId),PaperProblemEntity::getPaperId,paperId);
        query.orderByAsc(PaperProblemEntity::getProblemOrder);
        List<PaperProblemEntity> paperProblemEntities=baseMapper.selectList(query);

        return paperProblemEntities.stream()
                .map(PaperProblemEntity::getProblemId)
                .collect(Collectors.toList());
    }

    @Override
    public PaperProblemEntity getPaperProblemEntityByPaperIdAndpProblemOrder(Long paperId,Long problemOrder) {
        LambdaQueryWrapper<PaperProblemEntity> query= Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(paperId),PaperProblemEntity::getPaperId,paperId);
        query.eq(ObjectUtils.isNotEmpty(problemOrder), PaperProblemEntity::getProblemOrder, problemOrder);

        PaperProblemEntity entity = baseMapper.selectOne(query);
        if (entity!= null) {
            return entity;
        }
        return null;
    }
    @Override
    public PaperProblemEntity updatePaperProblemEntity(PaperProblemEntity paperProblemEntity) {
        LambdaQueryWrapper<PaperProblemEntity> query= Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(paperProblemEntity.getId()),PaperProblemEntity::getId,paperProblemEntity.getId());
        baseMapper.update(paperProblemEntity,query);
        return paperProblemEntity;
    }
}
