package group.one.controller;
import group.one.entity.ExerciseEntity;
import group.one.service.SessionService;
import group.one.service.WrongProblemService;
import group.one.service.impl.ExerciseServiceImpl;
import group.one.service.impl.ProblemServiceImpl;
import group.one.service.impl.ProblemTagServiceImpl;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/exercise")
public class ExerciseController {

    /**
     * 本Controller需要的json格式为
     * {
     *     "userId":1,
     *     "courseId":1,
     *     "n":5
     *     }
     *     其中userId是用户id,courseId是课程id,n是要返回的题目个数
     */
    ExerciseServiceImpl service=new ExerciseServiceImpl();
    @Autowired
    WrongProblemService wrongProblemService;
    @Autowired
    ProblemTagServiceImpl problemTagService;
    @Autowired
    ProblemServiceImpl problemService;

    /**
     * 逐渐递增难度的题目
     * @param params
     * @return
     */
    @PostMapping("/{courseId}")
    public ExerciseEntity generate(@PathVariable ("courseId") Long courseId,@RequestBody Map<String, Object> params){
        ExerciseEntity entity = new ExerciseEntity();
        Long userId = Long.valueOf(params.get("userId").toString());
        Integer n = Integer.valueOf(params.get("n").toString());
        entity.setUserId(userId);
        List<Long> problemIds = wrongProblemService.getNProblems(userId, courseId, Long.valueOf(n));
        List<Long> tagIds=new ArrayList<>();
        for(Long problemId:problemIds) {
            tagIds.addAll(problemTagService.getTagIdsByProblemId(problemId));
        }
        for(Long tagId:tagIds) {
            for(double i=1;i<6;i++) {
                entity.getExercises().addAll(problemTagService.getProblemTitlesByTagIdAndDifficulty(tagId, String.valueOf(i)));
            }
        }
        return entity;
    }

    /**
     *  用户自己选择课程和难度范围进行练习
     * @param course
     * @param params
     * @return
     */
    @PostMapping("/select/{courseId}")
    public ExerciseEntity add(@PathVariable("courseId") Long courseId,@PathVariable("courseId") Long course,@RequestBody Map<String, Object> params) {

        ExerciseEntity entity = new ExerciseEntity();
        Long userId = Long.valueOf(params.get("userId").toString());
        Integer n = Integer.valueOf(params.get("n").toString());
        Integer upperBound = Integer.valueOf(params.get("upperBound").toString());
        Integer lowerBound = Integer.valueOf(params.get("lowerBound").toString());
        try{
        List<String> exercises = service.getExercisesBody(userId, courseId, n, upperBound, lowerBound);
        List<String> descriptions = service.getExercisesDescriptions(userId, courseId, n, upperBound, lowerBound);
        entity.setCourseId(courseId);
        entity.setDescriptions(descriptions);
        entity.setExercises(exercises);
        return entity;}
        catch (Exception e){
            log.error(e.getMessage());
            return null;
        }
    }

    /**
     * 用户基于自己的错题进行学习
     * @param params
     * @return
     */
    @PostMapping("/my-wrong-problems")
    public ExerciseEntity myWrongProblems(@RequestBody Map<String, Object> params){
        ExerciseEntity entity = new ExerciseEntity();
        Long userId = Long.valueOf(params.get("userId").toString());
        Long courseId = Long.valueOf(params.get("courseId").toString());
        Long n=1L;
        if(params.containsKey("n")){n=Long.valueOf(params.get("n").toString());}
        List<Long> problemIds = wrongProblemService.getNProblems(userId, courseId, n);
        List<String> exercises=problemService.selectTitlesByProblemIds(problemIds);
        List<String> descriptions=problemService.selectDescriptionsByProblemIds(problemIds);
        //去重
        exercises.stream().distinct().collect(Collectors.toList());
        entity.setExercises(exercises);
        entity.setDescriptions(descriptions);
        //判定返回题长度N
        entity.setN(exercises.size());
        entity.setUserId(userId);
        entity.setCourseId(courseId);
        return entity;
    }

    /**随机生成该科目的练习题
     *
     * @param courseId
     * @param params
     * @return
     */
    @PostMapping("/random/{courseId}")
    public ExerciseEntity random(@PathVariable("courseId") Long courseId,@RequestBody Map<String, Object> params) {
        ExerciseEntity entity = new ExerciseEntity();
        Long userId = Long.valueOf(params.get("userId").toString());
        Long upperBound = Long.valueOf(params.get("upperBound").toString());
        Long lowerBound = Long.valueOf(params.get("lowerBound").toString());
        entity.setUserId(userId);
        entity.setCourseId(courseId);
        entity.setExercises(problemService.selectTitlesByDifficultyInterval(String.valueOf(upperBound), String.valueOf(lowerBound)));
        return entity;
    }

    /**
     * 每日一题:根据用户的错题，生成一个和其tag相匹配的题目
     * @param params
     */
    @PostMapping("/daily")
    public ExerciseEntity daily(@RequestBody Map<String, Object> params) {
        ExerciseEntity entity = new ExerciseEntity();
        Long userId = Long.valueOf(params.get("userId").toString());
        Long courseId = Long.valueOf(params.get("courseId").toString());
        Long n=1L;
        if(params.containsKey("n")){n=Long.valueOf(params.get("n").toString());}
        //如果用户没有输入n
        List<Long> problemIds = new ArrayList<>();
        Long problemId = wrongProblemService.getNProblems(userId, courseId, n).get(new Random().nextInt(n.intValue()));
        problemIds.add(problemId);
        entity.setDescriptions(problemService.selectDescriptionsByProblemIds(problemIds));
        entity.setUserId(userId);
        entity.setCourseId(courseId);
        entity.setExercises(problemService.selectTitlesByProblemIds(problemIds));
        return entity;
    }
}
