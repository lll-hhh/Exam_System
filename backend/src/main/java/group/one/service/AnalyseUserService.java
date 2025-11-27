package group.one.service;

import group.one.entity.AnalyseUserEntity;

import java.util.List;
import java.util.Optional;


public interface AnalyseUserService{

    /**
     * 查询学生的最高分，最低分，平均分
     * @param numbers
     * @return
     */
    public Integer getAverage(List<Integer> numbers);
    public Integer getHighest(List<Integer> numbers);
    Integer getLowest(List<Integer> numbers);

    /**
     * 计算班级的及格率
     * @param sortedScores
     * @return
     */
    Integer getPassRate(List<Integer> sortedScores);
}
