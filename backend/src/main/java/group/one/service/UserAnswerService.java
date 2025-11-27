package group.one.service;

import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.UserAnswerEntity;

import java.util.List;

public interface UserAnswerService extends IService<UserAnswerEntity> {
    UserAnswerEntity insert(UserAnswerEntity userAnswerEntity);
    boolean delete(UserAnswerEntity userAnswerEntity);
    UserAnswerEntity update(UserAnswerEntity userAnswerEntity);
    UserAnswerEntity select(UserAnswerEntity userAnswerEntity);

    Integer getScore(Long sessionId, Long problemId);
    Boolean checkAnswer(Long sessionId, Long problemId);
    String getAnswer(Long sessionId, Long problemId);
    Boolean setCorrect(Long sessionId, Long problemId, Integer correct);
    Boolean setAnswer(Long sessionId, Long problemId, String answer);
    List<String> getAnswerList(Long sessionId);
    List<Integer> getScoreList(Long sessionId);
}
