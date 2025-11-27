package group.one.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.ProblemChoicesEntity;
import group.one.entity.ProblemEntity;
import group.one.entity.ProblemTagEntity;
import group.one.entity.TagEntity;
import org.springframework.web.multipart.MultipartFile;
import group.one.utils.Result;

import java.util.List;
import java.util.Map;

public interface ProblemService extends IService<ProblemEntity> {

    /**
     * 插入一个新的问题（ProblemEntity）。
     *
     * @param problem 要插入的问题实体
     * @return 操作结果，包含成功或失败信息
     */
    Result insertOne(ProblemEntity problem);

    /**
     * 插入一个新的问题（ProblemEntity）及其多个选择题选项（ProblemChoicesEntity）。
     *
     * @param problem  要插入的问题实体
     * @param choices  与问题关联的选择题选项列表
     * @return 操作结果，包含成功或失败信息
     */
    Result insertOne(ProblemEntity problem, List<ProblemChoicesEntity> choices);

    /**
     * 插入一个新的问题（ProblemEntity）及其单个选择题选项（ProblemChoicesEntity）。
     *
     * @param problem  要插入的问题实体
     * @param choice   与问题关联的单个选择题选项
     * @return 操作结果，包含成功或失败信息
     */
    Result insertOne(ProblemEntity problem, ProblemChoicesEntity choice);

    /**
     * 上传文件并处理，返回一个表示操作结果的对象，可能包含文件存储位置、文件名等信息。
     *
     * @param file 要上传的文件
     * @return 操作结果，包含成功或失败信息以及文件相关信息
     */
    Result insertFile(MultipartFile file);

    /**
     * 根据提供的问题实体删除对应的数据记录，返回布尔值表示操作是否成功。
     *
     * @param problem 要删除的问题实体
     * @return 删除操作是否成功
     */
    boolean delete(ProblemEntity problem);

    /**
     * 更新现有的问题实体，传入的是需要更新的实体对象，返回更新后的实体对象。
     *
     * @param problem 要更新的问题实体
     * @return 更新成功后返回更新后的实体对象
     */
    ProblemEntity update(ProblemEntity problem);

    /**
     * 根据给定的参数分页查询问题实体列表，IPage 是分页插件提供的封装类，可以包含分页信息和数据列表。
     *
     * @param params 查询参数，可以包含分页信息和其他筛选条件（如问题名称、创建时间等）
     * @return 包含分页信息的问题实体列表
     */
    IPage<ProblemEntity> select(Map<String, Object> params);

    /**
     * 根据给定的问题标签列表查询匹配的问题实体列表，返回符合条件的所有问题实体。
     *
     * @param problemtaglist 与问题关联的 ProblemTagEntity 列表
     * @return 符合条件的问题实体列表
     */
    List<ProblemEntity> selectList(List<ProblemTagEntity> problemtaglist);

    /**
     * 根据给定的 ID 列表查询匹配的问题实体列表，返回对应的实体对象列表。
     *
     * @param idList 问题 ID 列表
     * @return 对应的问题实体列表
     */
    List<ProblemEntity> selectByIdList(List<Long> idList);

    /**
     * 根据给定的问题 ID 列表和难度级别查询匹配的问题实体列表。
     *
     * @param problemIds 问题 ID 列表
     * @param difficulty 难度级别（例如 "EASY", "MEDIUM", "HARD"）
     * @return 符合条件的问题实体列表
     */
    List<ProblemEntity> selectByIdListAndDifficulty(List<Long> problemIds, String difficulty);

    /**
     * 根据给定的问题 ID 列表获取问题描述。
     *
     * @param problemIds 问题 ID 列表
     * @return 问题描述列表，每个描述对应一个问题
     */
    List<String> selectDescriptionsByProblemIds(List<Long> problemIds);

    /**
     * 根据给定的问题 ID 列表获取问题题干。
     *
     * @param problemIds 问题 ID 列表
     * @return 问题题干列表，每个题干对应一个问题
     */
    List<String> selectTitlesByProblemIds(List<Long> problemIds);

    /**
     * 根据给定的难度区间获取问题标题。
     *
     * @param upperBound 难度上限
     * @param lowerBound 难度下限
     * @return 符合条件的问题标题列表
     */
    List<String> selectTitlesByDifficultyInterval(String upperBound, String lowerBound);

    /**
     * 根据给定的难度区间和课程 ID 获取问题描述。
     *
     * @param upperBound 难度上限
     * @param lowerBound 难度下限
     * @param courseId   课程的唯一标识符
     * @return 符合条件的问题描述列表
     */
    List<String> selectDescriptionsByDifficultyIntervalAndCourseId(String upperBound, String lowerBound, Long courseId);

    /**
     * 根据给定的问题 ID 列表和课程 ID 查询匹配的问题实体列表。
     *
     * @param problemIds 问题 ID 列表
     * @param courseId   课程的唯一标识符
     * @return 符合条件的问题实体列表
     */
    List<ProblemEntity> selectByProblemIdListAndCourseId(List<Long> problemIds, Long courseId);

    /**
     * 传入一个问题实体，查找相似的问题列表，并返回每个相似问题及其相似度评分。
     *
     * @param problem 要查找相似问题的问题实体
     * @return 相似问题列表，每个元素是一个 Map，包含相似问题实体及其相似度评分（Pair<Long, Long> 表示相似度评分）
     */
    List<Map<String,Object>> getSimilarityProblemByOne(ProblemEntity problem);

    /**
     * 传入多个问题实体，查找每个问题的相似问题列表，并返回嵌套的相似问题列表。
     *
     * @param problems 要查找相似问题的问题实体列表
     * @return 嵌套的相似问题列表，每个外层元素是一个 List，包含内层的相似问题 Map（每个 Map 包含相似问题实体及其相似度评分）
     */
    List<List<Map<String,Object>>> getSimilarityProblemByList(List<ProblemEntity> problems);

    /**
     * 根据给定的课程 ID 返回对应的問題 ID 列表。
     *
     * @param courseId 课程的唯一标识符
     * @return 对应的问题 ID 列表
     */
    List<Long> getProblemIdListByCourseId(Long courseId);

    /**
     * 返回所有问题
     *
     *
     * @return 返回所有问题
     */
    List<ProblemEntity> getAllProblems();
}
