package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import group.one.entity.ExerciseEntity;
import group.one.service.ExerciseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.*;
import java.util.function.Function;
@Service
public class ExerciseServiceImpl implements ExerciseService  {
    
    @Autowired
    private WrongProblemServiceImpl wrongProblemService;
    @Autowired
    private ProblemTagServiceImpl problemTagService;
    @Autowired
    private ProblemServiceImpl problemService;
    
    @Override
    public boolean add(ExerciseEntity exercise) {
        return false;
    }
    @Override
    public boolean delete(Serializable id) {
        return false;
    }
    @Override
    public boolean change(ExerciseEntity exercise) {
        return false;
    }
    @Override
    public ExerciseEntity get(Serializable id) {
        return null;
    }

    /**
     * 根据基本信息返回练习题干
     * @param userId
     * @param courseId
     * @param n
     * @param upperBound
     * @param lowerBound
     * @return
     */
    @Override
    public List<String> getExercisesBody(Long userId, Long courseId, Integer n, Integer upperBound, Integer lowerBound) {
        List<String> exercises = new ArrayList<>();
        List<Long> problemIds = wrongProblemService.getNProblems(userId, courseId, Long.valueOf(n));
        List<Long> tagIds = new ArrayList<>();
        for (Long problemId : problemIds) {
            tagIds.addAll(problemTagService.getTagIdsByProblemId(problemId));
        }
        for (Long tagId : tagIds) {
            for (int d = lowerBound; d <= upperBound; d++) {
                exercises.addAll(problemTagService.getProblemTitlesByTagIdAndDifficulty(tagId, String.valueOf(d)));
            }
        }
        if (exercises.size() == 0) {
            //没有的话，生成相应的随机题目
            System.out.println("没有题目!正在生成相应科目的随机题目");
            exercises = problemService.selectTitlesByDifficultyInterval(String.valueOf(upperBound), String.valueOf(lowerBound));
        }
        return exercises;
    }

    /**
     * 根据基本信息返回练习题描述
     * @param userId
     * @param courseId
     * @param n
     * @param upperBound
     * @param lowerBound
     * @return
     */
    @Override
    public List<String> getExercisesDescriptions(Long userId, Long courseId, Integer n, Integer upperBound, Integer lowerBound) {
        List<String> descriptions = problemService.selectDescriptionsByDifficultyIntervalAndCourseId(String.valueOf(upperBound), String.valueOf(lowerBound), courseId);
        return descriptions;
    }

    @Override
    public boolean saveBatch(Collection<ExerciseEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdateBatch(Collection<ExerciseEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean updateBatchById(Collection<ExerciseEntity> entityList, int batchSize) {
        return false;
    }

    @Override
    public boolean saveOrUpdate(ExerciseEntity entity) {
        return false;
    }

    @Override
    public ExerciseEntity getOne(Wrapper<ExerciseEntity> queryWrapper, boolean throwEx) {
        return null;
    }

    @Override
    public Map<String, Object> getMap(Wrapper<ExerciseEntity> queryWrapper) {
        return Collections.emptyMap();
    }

    @Override
    public <V> V getObj(Wrapper<ExerciseEntity> queryWrapper, Function<? super Object, V> mapper) {
        return null;
    }

    @Override
    public BaseMapper<ExerciseEntity> getBaseMapper() {
        return null;
    }

    @Override
    public Class<ExerciseEntity> getEntityClass() {
        return null;
    }


}
