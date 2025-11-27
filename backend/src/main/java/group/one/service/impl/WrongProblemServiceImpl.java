package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.WrongProblemDAO;
import group.one.entity.WrongProblemEntity;
import group.one.service.WrongProblemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.*;
import java.util.stream.Collectors;

@Service("WrongProblemService")
public class WrongProblemServiceImpl extends ServiceImpl<WrongProblemDAO, WrongProblemEntity> implements WrongProblemService {

    @Autowired
    private ProblemServiceImpl problemService;
    /**
     * 添加笔记功能
     * @param userId
     * @param problemId
     * @param note
     * @return
     */
    @Override
    public boolean addNote(Long userId, Long problemId, String note) {
        LambdaQueryWrapper<WrongProblemEntity> query = Wrappers.lambdaQuery();
        query.eq(WrongProblemEntity::getUserId,userId);
        query.eq(WrongProblemEntity::getProblemId,problemId);
        WrongProblemEntity wrongProblemEntity = super.list(query).get(0);
        if(wrongProblemEntity == null) {
            wrongProblemEntity = new WrongProblemEntity();
            wrongProblemEntity.setUserId(userId);
            wrongProblemEntity.setProblemId(problemId);
            wrongProblemEntity.setNote(note);
            add(wrongProblemEntity);
            return true;
        }
        wrongProblemEntity.setNote(note);
        change(wrongProblemEntity);
        return true;
    }

    @Override
    public WrongProblemEntity findNote(Long userId, Long problemId) {
        LambdaQueryWrapper<WrongProblemEntity> query = Wrappers.lambdaQuery();
        query.eq(WrongProblemEntity::getUserId,userId);
        query.eq(WrongProblemEntity::getProblemId,problemId);
        try{
        WrongProblemEntity wrongProblemEntity = super.list(query).get(0);return wrongProblemEntity;}
        catch (Exception e) {
            return null;
        }
    }

    @Override
    public boolean addErrorProblem(Long userId, Long problemId) {
        WrongProblemEntity wrongProblemEntity = new WrongProblemEntity();
        wrongProblemEntity.setUserId(userId);
        wrongProblemEntity.setProblemId(problemId);
        add(wrongProblemEntity);
        return true;
    }

    @Override
    public boolean add(WrongProblemEntity entity) {
        return super.save(entity);
    }

    @Override
    public boolean delete(Serializable id) {
        return super.removeById(id);
    }

    @Override
    public boolean change(WrongProblemEntity entity) {
        return super.updateById(entity);
    }

    @Override
    public WrongProblemEntity get(Serializable id) {
        return super.getById(id);
    }

    public List<Long> getAllWrongProblemIds(Long userId) {
        if (userId == null) {
            return Collections.emptyList();
          }
        LambdaQueryWrapper<WrongProblemEntity> query = Wrappers.lambdaQuery();
        query.eq(WrongProblemEntity::getUserId,userId);
        List<WrongProblemEntity> wrongProblems = super.list(query);
        return wrongProblems.stream()
                .map(WrongProblemEntity::getProblemId)
                .collect(Collectors.toList());
    }

    @Override
    public List<Long> getWrongProblemIds(Long userId,Long courseId) {
        List<Long> allwrongProblemIdList = getAllWrongProblemIds(userId);
        List<Long> allCourseProblemIdList = problemService.getProblemIdListByCourseId(courseId);
        List<Long> result = new ArrayList<>();
        //筛选出学科的错误题id
        for (Long problemId : allwrongProblemIdList) {
            if (allCourseProblemIdList.contains(problemId)) {
                result.add(problemId);
            }
        }
        return result;
    }

    @Override
    public List<Long> getNProblems(Long userId, Long courseId, Long n) {
        List <Long> wrongProblemIdList = getWrongProblemIds(userId,courseId);
        List<Long> result = new ArrayList<>();
        for (int i = 0; i < (n > wrongProblemIdList.size() ? wrongProblemIdList.size() : n); i++) {
            result.add(wrongProblemIdList.get(i));
        }
        if (result==null) return Collections.emptyList();
        return result;
    }

    @Override
    public List<String> getAllWrongProblemTags(List<Long> wrongProblemIdList) {
        return Collections.emptyList();
    }

    /**
     * 根据用户id和题目id删除错误题
     * @param userId
     * @param problemId
     * @return
     */
    @Override
    public boolean deleteByProblemId(Long userId,Long problemId) {
        LambdaQueryWrapper<WrongProblemEntity> query = Wrappers.lambdaQuery();
        query.eq(WrongProblemEntity::getProblemId,problemId);
        query.eq(WrongProblemEntity::getUserId,userId);
        return super.remove(query);
    }
    @Override
    public IPage<WrongProblemEntity> listAll(Integer curPage, Integer limit) {
        LambdaQueryWrapper<WrongProblemEntity> query = Wrappers.lambdaQuery();
        query.orderByDesc(WrongProblemEntity::getId);
        return baseMapper.selectPage(new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(curPage, limit), query);
    }


    /**
     * 根据错题id返回错题描述
     * @param userId
     * @param courseId
     * @param n
     * @return
     */
    @Override
    public List<String> getProblemDescriptions(Long userId, Long courseId, Integer n) {
        List<String> exercises = new ArrayList<>();
        List<Long> problemIds = getNProblems(userId, courseId, Long.valueOf(n));
        exercises=problemService.selectDescriptionsByProblemIds(problemIds);
        if (exercises.size() == 0) {
            System.out.println("没有题目!");
        }
        return exercises;
    }
}
