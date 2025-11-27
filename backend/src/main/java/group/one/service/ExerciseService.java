package group.one.service;

import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.ExerciseEntity;

import java.io.Serializable;
import java.util.List;

public interface ExerciseService extends IService<ExerciseEntity> {
    boolean add(ExerciseEntity exercise);
    boolean delete(Serializable id);
    boolean change(ExerciseEntity exercise);
    ExerciseEntity get(Serializable id);

    /**
     * 获取该科目的练习题
     * 依据·userId, courseId, n, upperBound, lowerBound
     * @param userId
     * @param courseId
     * @param n
     * @param upperBound
     * @param lowerBound
     * @return
     */
    List<String> getExercisesBody(Long userId, Long courseId, Integer n, Integer upperBound, Integer lowerBound);
    List<String> getExercisesDescriptions(Long userId, Long courseId, Integer n, Integer upperBound, Integer lowerBound);
}
