package group.one.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.ExamEntity;

import java.time.LocalDateTime;

public interface ExamService extends IService<ExamEntity> {
    ExamEntity getById(Long id);
    ExamEntity add(ExamEntity examEntity);
    void delete(Long id);
    IPage<ExamEntity> listAll(Integer curPage, Integer limit);
    ExamEntity modifyById(Long id,ExamEntity examEntity);
    ExamEntity changeStartTime(Long id, LocalDateTime startTime);
    ExamEntity changeEndTime(Long id, LocalDateTime endTime);
    ExamEntity changeDuration(Long id, Integer duration);
    ExamEntity changeShowScore(Long id, Integer showScore);
    ExamEntity changeShuffle(Long id, Integer shuffle);
    Boolean isShowScore(Long id);
    LocalDateTime getStartTime(Long id);
    LocalDateTime getEndTime(Long id);
    Integer getDuration(Long id);
}