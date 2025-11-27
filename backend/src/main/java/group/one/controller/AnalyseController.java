package group.one.controller;

import group.one.entity.AnalyseUserEntity;
import group.one.entity.WrongProblemEntity;
import group.one.service.AnalyseUserService;
import group.one.service.SessionService;
import group.one.service.WrongProblemService;
import group.one.service.impl.*;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/analyse")
public class AnalyseController {
    /**Date in 28/12/2024
     * 解决了空指针报错
     * Tianlang
     */
    /**
     * 本Controller需要的基本json格式为
     * {
     *     "userId": 1,
     *     “courseId": 1
     *     "classId": 1
     *     }
     * 其中userId是用户id，courseId是课程id，classId是班级id
     */
    @Autowired
    private SessionService sessionService;
    @Autowired
    private WrongProblemService wrongProblemService;
    @Autowired
    private ProblemTagServiceImpl problemTagService;
    @Autowired
    private TagServiceImpl tagService;
    @Autowired
    private UserServiceImpl UserService;
    AnalyseUserService service=new AnalyseUserServiceImpl();

    /**
     * 分析用户本次考试的成绩,在班级的排名
     * @param params
     * @return
     */
    @PostMapping
    public AnalyseUserEntity root(@RequestBody Map<String, Object> params) {
        AnalyseUserEntity entity = new AnalyseUserEntity();
        Long userId = Long.valueOf(params.get("userId").toString());
        Long courseId = Long.valueOf(params.get("courseId").toString());
        List<Integer> scores = sessionService.getNScores(userId, courseId, 1L);
        List<Integer> ranks = sessionService.getNRanks(userId, courseId, 1L);
        entity.setUserId(userId);
        entity.setCourseId(courseId);
        //System.out.println(ranks);
        entity.setNearestTestRank(ranks.get(0));
        entity.setNearestTestScore(scores.get(0));
        return entity;
    }

    /**
     * 用户对应学科N次考试的成绩，均分，表现情况
     */
    @PostMapping("/comprehension/{n}")
    public AnalyseUserEntity comprehension(@PathVariable("n") Long n,@RequestBody Map<String, Object> params) {
    AnalyseUserEntity entity = new AnalyseUserEntity();
    Long userId = Long.valueOf(params.get("userId").toString());
    Long courseId = Long.valueOf(params.get("courseId").toString());
    List<Integer> scores = sessionService.getNScores(userId, courseId, n);
    List<Integer> ranks = sessionService.getNRanks(userId, courseId, n);
    entity.setUserId(userId);
    entity.setCourseId(courseId);
    entity.setBestScore(service.getHighest(scores));
    entity.setWorstScore(service.getLowest(scores));
    entity.setAvgScore(service.getAverage(scores));
    entity.setAvgRank(service.getAverage(scores));
    //获取总成绩和排名
    entity.setTotalRanks(ranks);
    entity.setTotalScores(scores);
    return entity;
}

    /**
     * 处理用户整体考试的数据
     * @param params
     * @return
     */
    @PostMapping("/analyse-test")
    public Map<String, Object> getComprehensiveAnalysis(@RequestBody Map<String, Object> params) {
        Long userId = Long.valueOf(params.get("userId").toString());
        Long courseId = Long.valueOf(params.get("courseId").toString());

        // 获取用户考试时的错误题
        List <Long> wrongProblemIdList = wrongProblemService.getWrongProblemIds(userId,courseId);
        //去重
        wrongProblemIdList = wrongProblemIdList.stream().distinct().collect(Collectors.toList());
        // 获取用户未掌握的知识点
        List<String> wrongProblemTags=new ArrayList<>();
        List<Long> wrongProblemTagIds = new ArrayList<>();
        for(Long wrongProblemId:wrongProblemIdList) {
           wrongProblemTagIds.addAll(problemTagService.getTagIdsByProblemId(wrongProblemId));
        }
        wrongProblemTags=tagService.getTagNamesByTagIds(wrongProblemTagIds);
        wrongProblemTags = wrongProblemTags.stream().distinct().collect(Collectors.toList());
        Map<String, Object> result = new HashMap<>();
        result.put("wrongProblem", wrongProblemIdList);
        result.put("tag", wrongProblemTags);
        return result;
    }

    /**
     * 处理用户相应科目的错误知识点展示
     * @param params
     */
    @PostMapping("/get-my-wrong-tags")
    public List<String> getMyWrongTags(@RequestBody Map<String, Object> params) {
        //获取用户对应科目的错误题tag
        Long userId = Long.valueOf(params.get("userId").toString());
        Long courseId = Long.valueOf(params.get("courseId").toString());
        // 获取用户在该课程中的错误题目ID列表
        List<Long> wrongProblemIdList = wrongProblemService.getWrongProblemIds(userId,courseId);
        // 去重
        wrongProblemIdList = wrongProblemIdList.stream().distinct().collect(Collectors.toList());
        // 获取错误题目对应的知识点标签ID列表
        List<Long> wrongProblemTagIds = new ArrayList<>();
        for (Long wrongProblemId : wrongProblemIdList) {
            wrongProblemTagIds.addAll(problemTagService.getTagIdsByProblemId(wrongProblemId));
        }
        // 去重
        wrongProblemTagIds = wrongProblemTagIds.stream().distinct().collect(Collectors.toList());
        // 根据标签ID获取标签名称
        List<String> wrongProblemTags = tagService.getTagNamesByTagIds(wrongProblemTagIds);
        // 去重并返回
        return wrongProblemTags.stream().distinct().collect(Collectors.toList());
    }
    /**
     * 分析班级的成绩，班级最高分，最低分，均分
     */
    @PostMapping("/{classId}/{courseId}")
    public AnalyseUserEntity classAnalyse(@PathVariable("classId") Long classId,@PathVariable("courseId") Long courseId,@RequestBody Map<String, Object> params) {
        AnalyseUserEntity entity = new AnalyseUserEntity();
        entity.setCourseId(courseId);
        entity.setClassId(classId);
        List <Long> userIds = UserService.getStudentsId(classId);
        List <Integer> scores = new ArrayList<>();
        scores = sessionService.getScores(userIds, courseId);
        entity.setBestScore(service.getHighest(scores));
        entity.setWorstScore(service.getLowest(scores));
        entity.setAvgScore(service.getAverage(scores));
        //将成绩从高到低排列
        List<Integer> sortedScores = scores.stream().sorted().collect(Collectors.toList());
        entity.setTotalScores(sortedScores);
        entity.setClassPassRate((double)service.getPassRate(sortedScores)/100);
        return entity;
    }

}
