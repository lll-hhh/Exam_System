package group.one.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.PaperEntity;
import group.one.entity.ProblemEntity;

import java.util.List;

public interface PaperService extends IService<PaperEntity> {
    public PaperEntity getById(Long id);
    public PaperEntity deleteById(Long id);
    public Long getCourseId(Long paperId);
    public List<Long> getPaperIdsByCourseId(Long courseId);
    public PaperEntity storePaper(PaperEntity paper);

    List<PaperEntity> storePaperList(List<PaperEntity> paperList);

    IPage<PaperEntity> listAll(Integer curPage, Integer limit);

    List<PaperEntity> getPapersByLogicalId(Long logicalPaperId);
    public List<ProblemEntity> browsePaper(Long id);
}
