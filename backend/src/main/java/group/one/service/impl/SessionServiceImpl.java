package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.SessionDAO;
import group.one.entity.SessionEntity;
import group.one.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service("sessionService")
public class SessionServiceImpl extends ServiceImpl<SessionDAO, SessionEntity> implements SessionService {
    @Autowired
    @Lazy
    private ExamService examService;

    @Autowired
    @Lazy
    private PaperService paperService;

    @Autowired
    @Lazy
    private WrongProblemService wrongProblemService;

    @Autowired
    @Lazy
    private PaperProblemService paperProblemService;

    @Autowired
    @Lazy
    private ProblemServiceImpl problemService;

    @Autowired
    @Lazy
    private ProblemChoicesServiceImpl problemChoicesService;

    @Autowired
    private UserAnswerServiceImpl userAnswerService;

    @Override
    public SessionEntity getById(Long id) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.eq(SessionEntity::getId, id);
        return baseMapper.selectOne(query);
    }

    @Override
    public SessionEntity add(SessionEntity sessionEntity) {
        baseMapper.insert(sessionEntity);
        return sessionEntity;
    }

    @Override
    public void delete(Long id) {
        baseMapper.deleteById(id);
    }

    @Override
    public IPage<SessionEntity> listAll(Integer curPage, Integer limit) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.orderByDesc(SessionEntity::getId);
        return baseMapper.selectPage(new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(curPage, limit), query);
    }

    @Override
    public SessionEntity modifyById(Long id, SessionEntity sessionEntity) {
        sessionEntity.setId(id);
        baseMapper.updateById(sessionEntity);
        return sessionEntity;
    }

    @Override
    public List<Integer> getNScores(Long userId, Long courseId, Long n) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.eq(SessionEntity::getUserId, userId);
        List<Long> paperIds = paperService.getPaperIdsByCourseId(courseId);
        log.debug("paperIds: "+paperIds);
        query.in(SessionEntity::getPaperId, paperIds);
        query.orderByDesc(SessionEntity::getId);
        List<SessionEntity> queryList=baseMapper.selectList(query);
        log.debug("queryList: "+queryList);
        //提取sessionEntity中的前n个score，如果不足n个则返回全部
        ArrayList<Integer> result= new ArrayList<>();
        for (int i = 0; i < queryList.size() && i < n; i++) {
            result.add(queryList.get(i).getScore());
        }
        return result;
    }

    @Override
    public List<Integer> getNRanks(Long userId, Long courseId, Long n) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.eq(SessionEntity::getUserId, userId);
        List<Long> paperIds = paperService.getPaperIdsByCourseId(courseId);
        query.in(SessionEntity::getPaperId, paperIds);
        query.orderByDesc(SessionEntity::getId);
        List<SessionEntity> queryList=baseMapper.selectList(query);
        //提取sessionEntity中的前n个rank，如果不足n个则返回全部
        ArrayList<Integer> result= new ArrayList<>();
        for (int i = 0; i < queryList.size() && i < n; i++) {
            result.add(queryList.get(i).getRanking());
        }
        return result;
    }
/*
    @Override
    public List<Integer> getNWrongProblems(Long userId, Long courseId, Integer n) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.eq(SessionEntity::getUserId, userId);
        List<Long> paperIds = paperService.getPaperIdsByCourseId(courseId);
        query.in(SessionEntity::getPaperId, paperIds);
        query.orderByDesc(SessionEntity::getId);
        List<SessionEntity> queryList=baseMapper.selectList(query);
        //提取sessionEntity中的前n个wrongProblems，如果不足n个则返回全部
        ArrayList<Integer> result= new ArrayList<>();
        for (int i = 0; i < queryList.size() && i < n; i++) {
            String correctness = queryList.get(i).getCorrectness();
            //correctness为"1;0;1;0;..."的形式，1代表正确
            String[] correctnessArray = correctness.split(";");
            for (int j = 0; j < correctnessArray.length; j++) {
                if (correctnessArray[j].equals("0")) {
                    result.add(j);
                }
            }
        }
        //去重
        List<Integer> resultList = new ArrayList<>();
        for (Integer integer : result) {
            if (!resultList.contains(integer)) {
                resultList.add(integer);
            }
        }
        return resultList;
    }
*/
    @Override
    public Long getPaperId(Long id) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.eq(SessionEntity::getId, id);
        SessionEntity sessionEntity = baseMapper.selectOne(query);
        return sessionEntity.getPaperId();
    }

    @Override
    public SessionEntity autoJudge(Long sessionId) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.eq(SessionEntity::getId, sessionId);
        SessionEntity sessionEntity = baseMapper.selectOne(query);

        Long paperId = sessionEntity.getPaperId();
        //get all problemId from PaperProblemService
        List<Long> problemIds = paperProblemService.getProblemIdsByPaperId(paperId);
        Integer score = 0;
        for (Long problemId : problemIds) {
            if(problemChoicesService.selectAnswerHeadsByProblemId(problemId).isEmpty()){
                continue;
            }
            Integer point=userAnswerService.getScore(sessionId, problemId);
            score += point;
            userAnswerService.setCorrect(sessionId, problemId, point);
            if (!userAnswerService.checkAnswer(sessionId, problemId)){
                wrongProblemService.addErrorProblem(sessionEntity.getUserId(), problemId);
            }
        }
        sessionEntity.setScore(score);
        baseMapper.update(sessionEntity,query);
        return sessionEntity;
    }

    @Override
    public Boolean isTimeValid(Long sessionId) {
        SessionEntity sessionEntity = getById(sessionId);
        Long examId= sessionEntity.getExamId();
        LocalDateTime now = LocalDateTime.now();
        if(now.isBefore(examService.getStartTime(examId))|| now.isAfter(examService.getEndTime(examId))){
            return false;
        }
        return !now.isAfter(sessionEntity.getStartTime().plusMinutes(examService.getDuration(examId)));
    }

    @Override
    public List<Integer> getScores(List<Long> userId, Long courseId) {
        LambdaQueryWrapper<SessionEntity> query = Wrappers.lambdaQuery();
        query.in(SessionEntity::getUserId, userId);
        List<Long> paperIds = paperService.getPaperIdsByCourseId(courseId);
        query.in(SessionEntity::getPaperId, paperIds);
        query.orderByDesc(SessionEntity::getId);
        List<SessionEntity> queryList=baseMapper.selectList(query);
        ArrayList<Integer> result= new ArrayList<>();
        for (SessionEntity sessionEntity : queryList) {
            result.add(sessionEntity.getScore());
        }
        return result;
    }

    @Override
    public String querySessionData(Long sessionId) {
        LambdaQueryWrapper<SessionEntity> query=Wrappers.lambdaQuery();
        query.eq(SessionEntity::getId,sessionId);
        SessionEntity sessionEntity=baseMapper.selectOne(query);
        Long paperId=sessionEntity.getPaperId();
        List<Long> problemIds=paperProblemService.getProblemIdsByPaperId(paperId);
        StringBuilder result=new StringBuilder();
        List<String> titles=problemService.selectTitlesByProblemIds(problemIds);
        List<String> descriptions=problemService.selectDescriptionsByProblemIds(problemIds);
        List<String> userAnswers=userAnswerService.getAnswerList(sessionId);
        List<Integer> scores=userAnswerService.getScoreList(sessionId);
        int n=titles.size();
        log.warn(problemIds.toString());//FIXME题目和作答的顺序不对应，数据库主键有关
        for (int i = 0; i < n; i++) {
            result.append(titles.get(i)).append("<br>");
            result.append(descriptions.get(i)).append("<br>");

            String correctAnswer=problemChoicesService.selectAnswerHeadsByProblemId(problemIds.get(i));
            if(!correctAnswer.isEmpty()){
                result.append("正确答案：").append(correctAnswer).append("<br>");
            }
            String userAnswer=userAnswers.get(i);
            if(userAnswer.isEmpty()){
                result.append("你的答案：未作答").append("<br>");
            }
            else{
                result.append("你的答案：").append(userAnswer).append("<br>");
            }
            if(scores.get(i)==null){
                result.append("得分：未批改").append("<br>");
            }
            else{
                result.append("得分：").append(scores.get(i)).append("<br>");
            }
            result.append("<br>");
        }
        return result.toString();
    }
}
