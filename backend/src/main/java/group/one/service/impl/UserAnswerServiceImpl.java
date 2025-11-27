package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.UserAnswerDAO;
import group.one.entity.UserAnswerEntity;
import group.one.service.PaperProblemService;
import group.one.service.ProblemChoicesService;
import group.one.service.SessionService;
import group.one.service.UserAnswerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service("userAnswerService")
public class UserAnswerServiceImpl extends ServiceImpl<UserAnswerDAO, UserAnswerEntity> implements UserAnswerService {
    @Autowired
    @Lazy
    private SessionService sessionService;

    @Autowired
    @Lazy
    private PaperProblemService paperProblemService;

    @Autowired
    @Lazy
    private ProblemChoicesService problemChoicesService;

    @Override
    public UserAnswerEntity insert(UserAnswerEntity userAnswerEntity) {
        return baseMapper.insert(userAnswerEntity)==1?userAnswerEntity:null;
    }

    @Override
    public boolean delete(UserAnswerEntity userAnswerEntity) {
        LambdaQueryWrapper<UserAnswerEntity> query=Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId,userAnswerEntity.getSessionId());
        query.eq(UserAnswerEntity::getProblemId,userAnswerEntity.getProblemId());
        return baseMapper.delete(query)==1;
    }

    @Override
    public UserAnswerEntity update(UserAnswerEntity userAnswerEntity) {
        LambdaQueryWrapper<UserAnswerEntity> query=Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId,userAnswerEntity.getSessionId());
        query.eq(UserAnswerEntity::getProblemId,userAnswerEntity.getProblemId());
        return baseMapper.update(userAnswerEntity,query)==1?userAnswerEntity:null;
    }

    @Override
    public UserAnswerEntity select(UserAnswerEntity userAnswerEntity) {
        return null;
    }

    @Override
    public Integer getScore(Long sessionId, Long problemId) {
        if(this.checkAnswer(sessionId,problemId)){
            Long paperId=sessionService.getPaperId(sessionId);
            log.warn(paperProblemService.getPointByPaperIdAndProblemId(paperId,problemId).toString());
            return paperProblemService.getPointByPaperIdAndProblemId(paperId,problemId).intValue();
        }
        return 0;
    }

    @Override
    public Boolean checkAnswer(Long sessionId, Long problemId) {
        LambdaQueryWrapper<UserAnswerEntity> query = Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId, sessionId);
        query.eq(UserAnswerEntity::getProblemId, problemId);
        UserAnswerEntity userAnswerEntity = baseMapper.selectOne(query);
        String userAnswer=userAnswerEntity.getAnswer();
        String correctAnswer=problemChoicesService.selectAnswerHeadsByProblemId(problemId);
        log.warn("userAnswer:"+userAnswer+" correctAnswer:"+correctAnswer);
        return userAnswer.equals(correctAnswer);
    }

    @Override
    public String getAnswer(Long sessionId, Long problemId) {
        LambdaQueryWrapper<UserAnswerEntity> query = Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId, sessionId);
        query.eq(UserAnswerEntity::getProblemId, problemId);
        UserAnswerEntity userAnswerEntity = baseMapper.selectOne(query);
        if(userAnswerEntity!=null){
            return userAnswerEntity.getAnswer();
        }
        return "";
    }

    @Override
    public Boolean setAnswer(Long sessionId, Long problemId, String answer) {
        LambdaQueryWrapper<UserAnswerEntity> query=Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId,sessionId).eq(UserAnswerEntity::getProblemId,problemId);
        UserAnswerEntity userAnswerEntity=baseMapper.selectOne(query);
        if(userAnswerEntity!=null){
            log.debug("Enter modify logic");
            userAnswerEntity.setAnswer(answer);
            userAnswerEntity.setCorrect(0);
            return baseMapper.update(userAnswerEntity,query)==1;
        }
        else {
            log.debug("Enter insert logic");
            userAnswerEntity=new UserAnswerEntity();
            userAnswerEntity.setSessionId(sessionId);
            userAnswerEntity.setProblemId(problemId);
            userAnswerEntity.setAnswer(answer);
            userAnswerEntity.setCorrect(0);
            return baseMapper.insert(userAnswerEntity)==1;
        }
    }

    @Override
    public List<String> getAnswerList(Long sessionId) {
        LambdaQueryWrapper<UserAnswerEntity> query=Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId,sessionId);
        List<UserAnswerEntity> userAnswerEntities=baseMapper.selectList(query);
        List<String> answerList=new ArrayList<>(userAnswerEntities.size());
        for(UserAnswerEntity userAnswerEntity:userAnswerEntities){
            answerList.add(userAnswerEntity.getAnswer());
        }
        return answerList;
    }

    @Override
    public List<Integer> getScoreList(Long sessionId) {
        LambdaQueryWrapper<UserAnswerEntity> query=Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId,sessionId);
        List<UserAnswerEntity> userAnswerEntities=baseMapper.selectList(query);
        List<Integer> scoreList=new ArrayList<>(userAnswerEntities.size());
        for(UserAnswerEntity userAnswerEntity:userAnswerEntities){
            scoreList.add(userAnswerEntity.getCorrect());
        }
        return scoreList;
    }

    @Override
    public Boolean setCorrect(Long sessionId, Long problemId, Integer point) {
        LambdaQueryWrapper<UserAnswerEntity> query=Wrappers.lambdaQuery();
        query.eq(UserAnswerEntity::getSessionId,sessionId);
        query.eq(UserAnswerEntity::getProblemId,problemId);
        UserAnswerEntity userAnswerEntity=baseMapper.selectOne(query);
        if(userAnswerEntity!=null){
            userAnswerEntity.setCorrect(point);
            log.error("session"+sessionId+" problem"+problemId+" id"+userAnswerEntity.getId()+" point"+point);
            return baseMapper.updateById(userAnswerEntity)==1;
        }
        return false;
    }
}
