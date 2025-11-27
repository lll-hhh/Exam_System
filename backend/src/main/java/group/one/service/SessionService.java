package group.one.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import group.one.entity.SessionEntity;
import java.util.List;

public interface SessionService extends IService<SessionEntity> {
    public SessionEntity getById(Long id);
    public SessionEntity add(SessionEntity sessionEntity);
    public void delete(Long id);
    public IPage<SessionEntity> listAll(Integer curPage, Integer limit);
    public SessionEntity modifyById(Long id,SessionEntity sessionEntity);
    public List<Integer> getNScores(Long userId,Long courseId,Long n);//n的类型有问题
    public List<Integer> getNRanks(Long userId,Long courseId,Long n);
    public Long getPaperId(Long id);
    public SessionEntity autoJudge(Long sessionId);
    public Boolean isTimeValid(Long sessionId);
    public List<Integer> getScores(List<Long> userId,Long courseId);
    public String querySessionData(Long sessionId);//考后查试卷原始数据
}
