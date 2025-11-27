package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.ExamDAO;
import group.one.entity.ExamEntity;
import group.one.service.ExamService;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;

@Service("examService")
public class ExamServiceImpl extends ServiceImpl<ExamDAO,ExamEntity> implements ExamService {


    @Override
    public ExamEntity getById(Long id) {
        LambdaQueryWrapper<ExamEntity> query = Wrappers.lambdaQuery();
        query.eq(ExamEntity::getId, id);
        //返回第一个元素，如果没有元素，返回null
        return baseMapper.selectOne(query);
        /*query.orderByDesc(ExamEntity::getId);

        int curPage=1;
        int limit=10;
        if(ObjectUtils.isNotEmpty(params.get("page"))){
            curPage=Integer.parseInt(params.get("page").toString());
        }
        if(ObjectUtils.isNotEmpty(params.get("limit"))){
            limit=Integer.parseInt(params.get("limit").toString());
        }

        IPage<ExamEntity> page= Page.of(curPage,limit);
        return baseMapper.selectPage(page,query);*/
    }

    @Override
    public ExamEntity add(ExamEntity examEntity) {
        baseMapper.insert(examEntity);
        return examEntity;
    }
    public void delete(Long id){
        baseMapper.deleteById(id);
    }

    @Override
    public IPage<ExamEntity> listAll(Integer curPage, Integer limit) {
        LambdaQueryWrapper<ExamEntity> query=Wrappers.lambdaQuery();
        query.orderByDesc(ExamEntity::getId);
        return baseMapper.selectPage(new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(curPage,limit),query);
    }

    public ExamEntity modifyById(Long id,ExamEntity examEntity){
        System.out.println(examEntity);
        examEntity.setId(id);
        baseMapper.updateById(examEntity);
        return examEntity;
    }

    @Override
    public ExamEntity changeStartTime(Long id, LocalDateTime startTime) {
        ExamEntity examEntity = getById(id);
        examEntity.setStartTime(startTime);
        baseMapper.updateById(examEntity);
        return examEntity;
    }

    @Override
    public ExamEntity changeEndTime(Long id, LocalDateTime endTime) {
        ExamEntity examEntity = getById(id);
        examEntity.setEndTime(endTime);
        baseMapper.updateById(examEntity);
        return examEntity;
    }

    @Override
    public ExamEntity changeDuration(Long id, Integer duration) {
        ExamEntity examEntity = getById(id);
        examEntity.setDuration(duration);
        baseMapper.updateById(examEntity);
        return examEntity;
    }

    @Override
    public ExamEntity changeShowScore(Long id, Integer showScore) {
        ExamEntity examEntity = getById(id);
        examEntity.setShowScore(showScore);
        baseMapper.updateById(examEntity);
        return examEntity;
    }

    @Override
    public ExamEntity changeShuffle(Long id, Integer shuffle) {
        ExamEntity examEntity = getById(id);
        examEntity.setShuffle(shuffle);
        baseMapper.updateById(examEntity);
        return examEntity;
    }

    @Override
    public Boolean isShowScore(Long id) {
        ExamEntity entity=getById(id);
        return entity.getShowScore()!=0;//0为不立刻显示成绩
    }

    @Override
    public LocalDateTime getStartTime(Long id) {
        ExamEntity entity=getById(id);
        return entity.getStartTime();
    }

    @Override
    public LocalDateTime getEndTime(Long id) {
        ExamEntity entity=getById(id);
        return entity.getEndTime();
    }

    @Override
    public Integer getDuration(Long id) {
        ExamEntity entity=getById(id);
        return entity.getDuration();
    }
}
