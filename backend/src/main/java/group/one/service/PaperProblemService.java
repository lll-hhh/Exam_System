package group.one.service;

import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.PaperEntity;
import group.one.entity.PaperProblemEntity;
import group.one.entity.ProblemEntity;

import java.util.List;

public interface PaperProblemService extends IService<PaperProblemEntity> {
    public List<Long> getProblemIdsByPaperId(Long id);
    public Long getPointByPaperIdAndProblemId(Long paperId,Long problemId);
    public PaperEntity storePaperWithLogicalId(Long id,PaperEntity paper);

    PaperProblemEntity store(PaperProblemEntity paperProblemEntity);

    List<Long> getProblemIdsByLogicalPaperId(Long logicalPaperId);
    PaperProblemEntity getPaperProblemEntityByPaperIdAndpProblemOrder(Long paperId,Long problemOrder);
    PaperProblemEntity updatePaperProblemEntity(PaperProblemEntity paperProblemEntity);
}
