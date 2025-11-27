package group.one.service;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.WrongProblemEntity;

import java.io.Serializable;
import java.util.List;

public interface WrongProblemService  extends IService<WrongProblemEntity> {
    /**
     *增删改查
     * @return
     */
    boolean addNote(Long userId,Long problemId,String note);


    WrongProblemEntity findNote(Long userId,Long problemId);
    boolean addErrorProblem(Long userId, Long problemId);
    boolean add(WrongProblemEntity wrongProblem);
    boolean delete(Serializable id);
    boolean change(WrongProblemEntity wrongProblem);
    WrongProblemEntity get(Serializable id);


    /**
     * 根据用户id和课程id返回错题id
     * @param userId
     * @param courseId
     * @return
     */
    List<Long> getWrongProblemIds(Long userId, Long courseId);

    /**
     * 返回近n道错题
     * @param userId
     * @param courseId
     * @param n
     * @return
     */
    List<Long> getNProblems(Long userId, Long courseId, Long n);

    List<String> getAllWrongProblemTags(List<Long> wrongProblemIdList);

    /**
     * 根据用户id和题目id删除错误题
     * @param userId
     * @param problemId
     * @return
     */
    boolean deleteByProblemId(Long userId,Long problemId);

    /**
     * 分页查询功能
     * @param curPage
     * @param limit
     * @return
     */
    public IPage<WrongProblemEntity> listAll(Integer curPage, Integer limit);

    /**
     * 获取错题的描述
     * @param userId
     * @param courseId
     * @param n
     * @return
     */
    List<String> getProblemDescriptions(Long userId, Long courseId, Integer n);
}
