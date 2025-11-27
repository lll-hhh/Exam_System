package group.one.service;

import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.ProblemChoicesEntity;
import group.one.utils.Result;

import java.util.List;


public interface ProblemChoicesService extends IService<ProblemChoicesEntity> {
    /**
     * 插入一个新的选择题选项（ProblemChoicesEntity）。
     *
     * @param choice 要插入的选择题选项实体
     * @return 操作结果，包含成功或失败信息
     */
    Result insertChoice(ProblemChoicesEntity choice);

    /**
     * 批量插入多个选择题选项（ProblemChoicesEntity）。
     *
     * @param choices 要插入的选择题选项实体列表
     * @return 操作结果，包含成功或失败信息
     */
    Result insertChoices(List<ProblemChoicesEntity> choices);

    /**
     * 根据选择题选项实体的主键删除对应的记录。
     *
     * @param choice 要删除的选择题选项实体
     * @return 删除操作是否成功
     */
    boolean delete(ProblemChoicesEntity choice);

    /**
     * 根据选择题选项 ID 删除对应的记录。
     *
     * @param choiceId 选择题选项的唯一标识符
     * @return 删除操作是否成功
     */
    boolean delete(Long choiceId);

    /**
     * 批量删除多个选择题选项。
     *
     * @param choiceIds 要删除的选择题选项 ID 列表
     * @return 删除操作是否成功
     */
    boolean delete(List<Long> choiceIds);

    /**
     * 根据选择题选项 ID 查找对应的选项实体。
     *
     * @param choiceId 选择题选项的唯一标识符
     * @return 对应的选择题选项实体
     */
    ProblemChoicesEntity selectChoiceById(Long choiceId);

    /**
     * 根据多个选择题选项 ID 查找对应的选项实体列表。
     *
     * @param choiceIds 选择题选项 ID 列表
     * @return 对应的选择题选项实体列表
     */
    List<ProblemChoicesEntity> selectChoicesByIds(List<Long> choiceIds);

    /**
     * 根据问题 ID 查找与该问题关联的所有选择题选项。
     *
     * @param problemId 问题的唯一标识符
     * @return 与该问题关联的选择题选项列表
     */
    List<ProblemChoicesEntity> selectChoicesByProblemId(Long problemId);

    /**
     * 根据多个问题 ID 获取正确答案列表。
     *
     * @param problemIds 问题 ID 列表
     * @return 正确答案列表，每个答案对应一个问题
     */
    List<String> selectAnswersByProblemIds(List<Long> problemIds);

    /**
     * 根据问题 ID 获取正确答案的题干（即题目内容）。
     *
     * @param problemId 问题的唯一标识符
     * @return 正确答案的题干
     */
    String selectAnswerHeadsByProblemId(Long problemId);

    /**
     * 根据问题 ID 获取正确答案的题干（即题目内容）。
     *
     * @param problemId 问题的唯一标识符
     * @return 正确答案的题干
     */
    List<String> selectProblemChoicesByProblemId(Long problemId);
}
