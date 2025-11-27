package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.ProblemChoicesDAO;
import group.one.entity.ProblemChoicesEntity;
import group.one.entity.ProblemEntity;
import group.one.entity.ProblemTagEntity;
import group.one.service.ProblemChoicesService;
import group.one.service.ProblemService;
import group.one.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Collections;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;

@Service("problemChoicesService")
public class ProblemChoicesServiceImpl extends ServiceImpl<ProblemChoicesDAO,ProblemChoicesEntity>
        implements ProblemChoicesService {

    @Override
    @Transactional
    public Result insertChoice(ProblemChoicesEntity choice){
        save(choice);
        return Result.success(choice);
    }
    @Override
    @Transactional
    public Result insertChoices(List<ProblemChoicesEntity> choices){
        for(ProblemChoicesEntity choice:choices){
            save(choice);
        }
        return Result.success();
    }
    @Override
    @Transactional
    public boolean delete(ProblemChoicesEntity choice){
        if (choice == null || choice.getId() == null) {
            return false;
        }
        return removeById(choice.getId());
    }
    @Override
    @Transactional
    public boolean delete(Long choiceId){
        if (choiceId == null) {
            return false;
        }
        return removeById(choiceId);
    }
    @Override
    @Transactional
    public boolean delete(List<Long> choiceIds){
        if (choiceIds == null || choiceIds.isEmpty()) {
            return false;
        }
        return removeByIds(choiceIds);
    }
    @Override
    @Transactional
    public ProblemChoicesEntity selectChoiceById(Long choiceId){
        if (choiceId == null) {
            return null;
        }
        return getById(choiceId);
    }
    @Override
    @Transactional
    public List<ProblemChoicesEntity> selectChoicesByIds(List<Long> choiceIds){
        if (choiceIds == null || choiceIds.isEmpty()) {
            return Collections.emptyList();
        }
        return listByIds(choiceIds);
    }
    @Override
    @Transactional
    public List<ProblemChoicesEntity> selectChoicesByProblemId(Long problemId){
        if (problemId == null) {
            return Collections.emptyList();
        }
        LambdaQueryWrapper<ProblemChoicesEntity> wrapper = Wrappers.<ProblemChoicesEntity>lambdaQuery()
                .eq(ProblemChoicesEntity::getProblemId, problemId);
        return list(wrapper);
    }
    @Override
    @Transactional
    public List<String> selectAnswersByProblemIds(List<Long> problemIds){
        LambdaQueryWrapper<ProblemChoicesEntity> problemChoicesWrapper = Wrappers.<ProblemChoicesEntity>lambdaQuery()
                .in(!problemIds.isEmpty(), ProblemChoicesEntity::getId, problemIds)
                .eq(ProblemChoicesEntity::getIsAnswer,"1");

        // 执行查询并获取符合条件的 ProblemChoicesEntity 列表
        List<ProblemChoicesEntity> problemChoicesList = this.list(problemChoicesWrapper);

        // 使用 Stream API 提取 choice 字段并收集到 List<String>
        List<String> answerChoices = problemChoicesList.stream()
                .map(ProblemChoicesEntity::getChoice) // 假设 getChoiceContent() 返回 String 类型的选择内容
                .collect(Collectors.toList());

        return answerChoices;
    }
    @Override
    @Transactional
    public String selectAnswerHeadsByProblemId(Long problemId) {
        LambdaQueryWrapper<ProblemChoicesEntity> problemChoicesWrapper = Wrappers.<ProblemChoicesEntity>lambdaQuery()
                .eq(ProblemChoicesEntity::getProblemId, problemId);
        List<ProblemChoicesEntity> problemChoicesEntities=list(problemChoicesWrapper);
        StringBuilder out= new StringBuilder();
        int num=0;
        for(ProblemChoicesEntity problemChoicesEntity:problemChoicesEntities){
            if(Objects.equals(problemChoicesEntity.getIsAnswer(), "1")){
                char outone='A';
                outone+= (char) num;
                out.append(outone);
            }
            num++;
        }
        return out.toString();
    }
    @Override
    @Transactional
    public List<String> selectProblemChoicesByProblemId(Long problemId){
        LambdaQueryWrapper<ProblemChoicesEntity> wrapper=Wrappers.<ProblemChoicesEntity>lambdaQuery()
                .eq(ProblemChoicesEntity::getProblemId,problemId);
        List<ProblemChoicesEntity> problemChoicesEntities=list(wrapper);
        return problemChoicesEntities.stream()
                .map(ProblemChoicesEntity::getChoice)
                .collect(Collectors.toList());
    }
}
