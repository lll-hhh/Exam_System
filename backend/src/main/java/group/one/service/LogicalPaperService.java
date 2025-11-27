package group.one.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mysql.cj.log.Log;
import group.one.dao.ExamDAO;
import group.one.entity.*;
import org.springframework.stereotype.Service;

import java.util.List;

public interface LogicalPaperService extends IService<LogicalPaperEntity> {
    public LogicalPaperEntity getById(Long id);
    public LogicalPaperEntity deleteById(Long id);
    public String calculateDiffculty(Long id);
    public Double calculatePassRate(Long id);
    public List<LogicalPaperEntity> autoCreatLogicalPaper(PaperTemplateEntity paperTemplateEntity);
    public List<ProblemEntity> browsePaper(Long id);
    public LogicalPaperEntity updateLogicalPaper(LogicalPaperEntity logicalPaper);

    public List<PaperEntity> shuffleOrderOfQuestions(Integer num,Long logicalPaperId);
    public List<Long> getLogicalPaperIdsByCourseId(Long courseId);
    public LogicalPaperEntity storeLogicalPaper(LogicalPaperEntity logicalPaper);
    public List<Object> updateProblem(Long logicalPaperId,Long problemOrder,Long newProblemId);

    IPage<LogicalPaperEntity> listAll(Integer curPage, Integer limit);

}
