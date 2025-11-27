package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.LogicalPaperDAO;
import group.one.entity.*;
import group.one.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import java.util.*;
import java.util.stream.Collectors;

@Service("LogicalPaperService")
public class LogicalPaperServiceImpl extends ServiceImpl<LogicalPaperDAO, LogicalPaperEntity> implements LogicalPaperService {

    @Autowired
    @Lazy
    private PaperProblemService paperProblemService;
    @Autowired
    @Lazy
    private PaperService paperService;
    @Autowired
    private ProblemService problemService;
    @Autowired
    private TagService tagService;
    @Autowired
    private ProblemTagService problemTagService;
    @Autowired
    private CourseService courseService;

    @Override
    public LogicalPaperEntity getById(Long id) {
        LambdaQueryWrapper<LogicalPaperEntity> query = Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(id),LogicalPaperEntity::getId,id);
        return baseMapper.selectOne(query);
    }

    @Override
    public LogicalPaperEntity deleteById(Long id)
    {
        LambdaQueryWrapper<LogicalPaperEntity> query = Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(id),LogicalPaperEntity::getId,id);
        LogicalPaperEntity logicalPaper=getById(id);
        baseMapper.deleteById(query);
        return logicalPaper;
    }
    @Override
    public String calculateDiffculty(Long paperId) {
        List<Long> problemIds=paperProblemService.getProblemIdsByPaperId(paperId);
        List<ProblemEntity> problems=problemService.selectByIdList(problemIds);

        double diffculty = 0;
        for(ProblemEntity problem: problems)
        {
            diffculty+=Double.parseDouble(problem.getDifficulty());
        }
        diffculty/=problems.size();
        Long tempdif=(long)(diffculty*100);
        diffculty=1.0*tempdif/100;
        return String.valueOf(diffculty);
    }

    @Override
    public Double calculatePassRate(Long id)
    {
        List<Long> problemIds=paperProblemService.getProblemIdsByPaperId(id);
        List<ProblemEntity> problems=problemService.selectByIdList(problemIds);

        double passRate = 0;
        for(ProblemEntity problem: problems)
        {
            passRate+=problem.getPassRate();
        }
        passRate/=problems.size();
        return passRate;
    }

    @Override
    public List<LogicalPaperEntity> autoCreatLogicalPaper(PaperTemplateEntity paperTemplate) {

        List<LogicalPaperEntity> logicalPaperEntities=new ArrayList<>();
        Integer num=paperTemplate.getPaperNum();
        List<ProblemEntity> allSelectedProblems=new ArrayList<>();
        Long courseId = courseService.getCourseIdByName(paperTemplate.getCourse());
        String[] needTags = paperTemplate.getTagNameList();
        //所需要的tags列表
        List<String> tagList = new ArrayList<>(Arrays.asList(needTags));
        //根据tags得到所需要的tagIds
        List<Long> requiredTagIds = tagService.getTagIdsByTagNames(tagList);

        List<ProblemEntity> problems = new ArrayList<>();
        for (Long tagId : requiredTagIds) {
            problems.addAll(problemTagService.getProblemsByTagIdAndCourseId(tagId, courseId));
        }

        List<ProblemEntity> choiceProblems = new ArrayList<>();
        List<ProblemEntity> judgeProblems = new ArrayList<>();
        List<ProblemEntity> blankfillingProblems = new ArrayList<>();
        List<ProblemEntity> shortanswerProblems = new ArrayList<>();

        for (ProblemEntity problem : problems) {
            String type = problem.getType();
            switch (type) {
                case "选择":
                    choiceProblems.add(problem);
                    break;
                case "判断":
                    judgeProblems.add(problem);
                    break;
                case "填空":
                    blankfillingProblems.add(problem);
                    break;
                case "简答":
                    shortanswerProblems.add(problem);
            }
        }

        // 检查题目数量是否为零，避免除以零的错误
        Long oneChoiceProblemScore = paperTemplate.getChoiceNum() > 0 ? (long) paperTemplate.getChoiceScore() / paperTemplate.getChoiceNum() : 0;
        Long oneJudgeProblemScore = paperTemplate.getJudgeNum() > 0 ? (long) paperTemplate.getJudgeScore() / paperTemplate.getJudgeNum() : 0;
        Long oneBlankfillingProblemScore = paperTemplate.getBlankfillingNum() > 0 ? (long) paperTemplate.getBlankfillingScore() / paperTemplate.getBlankfillingNum() : 0;
        Long oneShortanswerProblemScore = paperTemplate.getShortanswerNum() > 0 ? (long) paperTemplate.getShortanswerScore() / paperTemplate.getShortanswerNum() : 0;

        Integer choiceProblemsSize=choiceProblems.size();
        Integer judgeProblemsSize=judgeProblems.size();
        Integer blankfillingProblemsSize=blankfillingProblems.size();
        Integer shortanswerProblemsSize=shortanswerProblems.size();

        for(int i=0;i<num;i++) {


            LogicalPaperEntity logicalPaper = new LogicalPaperEntity();
            logicalPaper.setCourseId(courseId);
            logicalPaper.setDifficulty(paperTemplate.getDifficultyExpectations());
            logicalPaper = storeLogicalPaper(logicalPaper);
            PaperEntity paper = new PaperEntity();

            List<ProblemEntity> selectedProblems = new ArrayList<>();

            // 选择题处理
            List<ProblemEntity> selectedChoiceProblems = new ArrayList<>();
            if (paperTemplate.getChoiceNum() > 0) {
                selectedChoiceProblems = selectProblems(choiceProblems,paperTemplate.getChoiceNum(), requiredTagIds, paperTemplate.getDifficultyExpectations(), paperTemplate.getPassRateExpectations(), selectedProblems,allSelectedProblems);
                selectedProblems.addAll(selectedChoiceProblems);
                allSelectedProblems.addAll(selectedChoiceProblems);
                choiceProblems.removeAll(selectedChoiceProblems);
            }

            // 判断题处理
            List<ProblemEntity> selectedJudgeProblems = new ArrayList<>();
            if (paperTemplate.getJudgeNum() > 0) {
                selectedJudgeProblems = selectProblems(judgeProblems,paperTemplate.getJudgeNum(), requiredTagIds, paperTemplate.getDifficultyExpectations(), paperTemplate.getPassRateExpectations(), selectedProblems,allSelectedProblems);
                selectedProblems.addAll(selectedJudgeProblems);
                allSelectedProblems.addAll(selectedJudgeProblems);
                judgeProblems.removeAll(selectedJudgeProblems);
            }

            // 填空题处理
            List<ProblemEntity> selectedBlankfillingProblems = new ArrayList<>();
            if (paperTemplate.getBlankfillingNum() > 0) {
                selectedBlankfillingProblems = selectProblems(blankfillingProblems, paperTemplate.getBlankfillingNum(), requiredTagIds, paperTemplate.getDifficultyExpectations(), paperTemplate.getPassRateExpectations(), selectedProblems,allSelectedProblems);
                selectedProblems.addAll(selectedBlankfillingProblems);
                allSelectedProblems.addAll(selectedBlankfillingProblems);
                blankfillingProblems.removeAll(selectedBlankfillingProblems);
            }

            // 简答题处理
            List<ProblemEntity> selectedShortanswerProblems = new ArrayList<>();
            if (paperTemplate.getShortanswerNum() > 0) {
                selectedShortanswerProblems = selectProblems(shortanswerProblems,paperTemplate.getShortanswerNum(), requiredTagIds, paperTemplate.getDifficultyExpectations(), paperTemplate.getPassRateExpectations(), selectedProblems,allSelectedProblems);
                selectedProblems.addAll(selectedShortanswerProblems);
                allSelectedProblems.addAll(selectedShortanswerProblems);
                shortanswerProblems.removeAll(selectedShortanswerProblems);
            }

            paperProblemService.storePaperWithLogicalId(logicalPaper.getId(), paper);

            Long problem_order = 1L;

            // 判断题处理
            if (!selectedJudgeProblems.isEmpty()) {
                for (ProblemEntity problem : selectedJudgeProblems) {
                    PaperProblemEntity paperProblemEntity = new PaperProblemEntity();
                    paperProblemEntity.setPaperId(paper.getId());
                    paperProblemEntity.setProblemId(problem.getId());
                    paperProblemEntity.setPoint(oneJudgeProblemScore);
                    paperProblemEntity.setProblemOrder(problem_order++);
                    paperProblemService.store(paperProblemEntity);
                }
            }

            // 选择题处理
            if (!selectedChoiceProblems.isEmpty()) {
                for (ProblemEntity problem : selectedChoiceProblems) {
                    PaperProblemEntity paperProblemEntity = new PaperProblemEntity();
                    paperProblemEntity.setPaperId(paper.getId());
                    paperProblemEntity.setProblemId(problem.getId());
                    paperProblemEntity.setPoint(oneChoiceProblemScore);
                    paperProblemEntity.setProblemOrder(problem_order++);
                    paperProblemService.store(paperProblemEntity);
                }
            }

            // 填空题处理
            if (!selectedBlankfillingProblems.isEmpty()) {
                for (ProblemEntity problem : selectedBlankfillingProblems) {
                    PaperProblemEntity paperProblemEntity = new PaperProblemEntity();
                    paperProblemEntity.setPaperId(paper.getId());
                    paperProblemEntity.setProblemId(problem.getId());
                    paperProblemEntity.setPoint(oneBlankfillingProblemScore);
                    paperProblemEntity.setProblemOrder(problem_order++);
                    paperProblemService.store(paperProblemEntity);
                }
            }

            // 简答题处理
            if (!selectedShortanswerProblems.isEmpty()) {
                for (ProblemEntity problem : selectedShortanswerProblems) {
                    PaperProblemEntity paperProblemEntity = new PaperProblemEntity();
                    paperProblemEntity.setPaperId(paper.getId());
                    paperProblemEntity.setProblemId(problem.getId());
                    paperProblemEntity.setPoint(oneShortanswerProblemScore);
                    paperProblemEntity.setProblemOrder(problem_order++);
                    paperProblemService.store(paperProblemEntity);
                }
            }
            logicalPaper.setDifficulty(Double.valueOf(calculateDiffculty(paper.getId())));
            updateLogicalPaper(logicalPaper);
            logicalPaperEntities.add(logicalPaper);
        }
        return logicalPaperEntities;
    }

    /**
     * 选择合适的题目，根据数量、难度期望和通过率期望进行筛选
     *
     * @param problems 题目列表
     * @param num 需要选择的题目数量
     * @param requiredTagIds 必需的标签ID列表
     * @param difficultyExpectation 难度期望
     * @param passRateExpectation 通过率期望
     * @param selectedProblems 已选题目列表
     * @return 选择的题目列表
     */
    private List<ProblemEntity> selectProblems(List<ProblemEntity> problems,int num, List<Long> requiredTagIds, double difficultyExpectation, double passRateExpectation, List<ProblemEntity> selectedProblems,List<ProblemEntity> allSelectedProblems) {
        if (problems.size() < num) {
            throw new IllegalArgumentException("Not enough problems of the required type.");
        }
        // 初始化结果集
        List<ProblemEntity> result = new ArrayList<>(selectedProblems);
        // 迭代选择题目直到达到所需数量
        while (result.size() - selectedProblems.size() < num) {
            ProblemEntity bestMatch = null;
            double maxScore = Double.NEGATIVE_INFINITY;

            for (ProblemEntity problem : problems) {
                if (!allSelectedProblems.contains(problem)&&!result.contains(problem)) {
                    List<TagEntity> tags = problemTagService.getTagsByProblemId(problem.getId());
                    List<Long> tagIds = tags.stream().map(TagEntity::getId).collect(Collectors.toList());

                    // 创建临时列表以包含当前选择的问题
                    List<ProblemEntity> tempResult = new ArrayList<>(result);
                    tempResult.add(problem);
                    // 计算当前选择的题目加上这个题目的难度和通过率的平均值
                    double avgDifficulty = calculateAverageDifficulty(tempResult);
                    double avgPassRate = calculateAveragePassRate(tempResult);
                    // 计算偏差
                    double diffDeviation = Math.abs(avgDifficulty - difficultyExpectation);
                    double passDeviation = Math.abs(avgPassRate - passRateExpectation);
                    double totalDeviation = (diffDeviation + passDeviation)/10;
                    // 计算优先级
                    int uniqueRequiredTagsCount = countUniqueRequiredTags(tempResult, requiredTagIds);
                    int matchingRequiredTagsCount = countMatchingRequiredTags(tagIds, requiredTagIds);

                    // 归一化处理
                    double normUniqueRequiredTagsCount = normalize(uniqueRequiredTagsCount, 0, requiredTagIds.size());
                    double normTotalDeviation = normalize(totalDeviation, 0, 1); // 假设最大偏差为1
                    double normMatchingRequiredTagsCount = normalize(matchingRequiredTagsCount, 0, requiredTagIds.size());

                    // 权值分配
                    double weightUniqueRequiredTagsCount = 0.6;
                    double weightTotalDeviation = 0.3;
                    double weightMatchingRequiredTagsCount = 0.1;

                    // 计算综合得分
                    double score = (weightUniqueRequiredTagsCount * normUniqueRequiredTagsCount) +
                            (-weightTotalDeviation * normTotalDeviation) +
                            (weightMatchingRequiredTagsCount * normMatchingRequiredTagsCount);

                    // 选择得分最高的问题
                    if (score > maxScore) {
                        maxScore = score;
                        bestMatch = problem;
                    }
                }
            }
            if (bestMatch != null) {
                result.add(bestMatch);
            } else {
                throw new IllegalStateException("No suitable problem found to match all required tags and expectations.");
            }
        }
        return result.subList(selectedProblems.size(), result.size());
    }
    /**
     * 计算所有题目的平均难度
     *
     * @param problems 题目列表
     * @return 平均难度
     */
    private double calculateAverageDifficulty(List<ProblemEntity> problems) {
        return problems.stream()
                .mapToDouble(problem -> Double.parseDouble(problem.getDifficulty()))
                .average()
                .orElse(0.0);
    }
    /**
     * 计算所有题目的平均通过率
     *
     * @param problems 题目列表
     * @return 平均通过率
     */
    private double calculateAveragePassRate(List<ProblemEntity> problems) {
        return problems.stream()
                .mapToDouble(ProblemEntity::getPassRate)
                .average()
                .orElse(0.0);
    }
    /**
     * 检查所有题目的标签是否包含所有必需的标签
     *
     * @param problems 题目列表
     * @param requiredTagIds 必需的标签ID列表
     * @return 是否包含所有必需的标签
     */
//    private boolean checkAllTagsCovered(List<ProblemEntity> problems, List<Long> requiredTagIds) {
//        Set<Long> coveredTagIds = new HashSet<>();
//        for (ProblemEntity problem : problems) {
//            List<TagEntity> tags = problemTagService.getTagsByProblemId(problem.getId());
//            List<Long> tagIds = tags.stream().map(TagEntity::getId).collect(Collectors.toList());
//            coveredTagIds.addAll(tagIds);
//        }
//        return coveredTagIds.containsAll(requiredTagIds);
//    }

    /**
     * 计算当前选择的题目加上这个题目的唯一必需标签的数量
     *
     * @param problems 当前选择的题目列表
     * @param requiredTagIds 必需的标签ID列表
     * @return 唯一必需标签的数量
     */
    private int countUniqueRequiredTags(List<ProblemEntity> problems, List<Long> requiredTagIds) {
        Set<Long> currentTagIds = new HashSet<>();
        for (ProblemEntity problem : problems) {
            List<TagEntity> tags = problemTagService.getTagsByProblemId(problem.getId());
            List<Long> tagIds = tags.stream().map(TagEntity::getId).collect(Collectors.toList());
            currentTagIds.addAll(tagIds);
        }
        return (int) requiredTagIds.stream().filter(currentTagIds::contains).count();
    }

    /**
     * 计算当前选择的题目加上这个题目的匹配必需标签的数量
     *
     * @param tagIds 当前题目的标签ID列表
     * @param requiredTagIds 必需的标签ID列表
     * @return 匹配必需标签的数量
     */
    private int countMatchingRequiredTags(List<Long> tagIds, List<Long> requiredTagIds) {
        return (int) tagIds.stream().filter(requiredTagIds::contains).count();
    }

    /**
     * 从题目列表中获取所有标签ID
     *
     * @param problems 题目列表
     * @return 标签ID列表
     */
    private List<Long> getTagIdsFromProblems(List<ProblemEntity> problems) {
        Set<Long> tagIdsSet = new HashSet<>();
        for (ProblemEntity problem : problems) {
            List<TagEntity> tags = problemTagService.getTagsByProblemId(problem.getId());
            List<Long> tagIds = tags.stream().map(TagEntity::getId).collect(Collectors.toList());
            tagIdsSet.addAll(tagIds);
        }
        return new ArrayList<>(tagIdsSet);
    }

    /**
     * 归一化处理
     *
     * @param value 要归一化的值
     * @param min 最小值
     * @param max 最大值
     * @return 归一化后的值
     */
    private double normalize(double value, double min, double max) {
        if (max == min) {
            return 0; // 避免除以零
        }
        return (value - min) / (max - min);
    }
    @Override
    public List<ProblemEntity> browsePaper(Long id) {
        LogicalPaperEntity logicalPaper = getById(id);
        if (logicalPaper == null) {
            return null;
        }
        Long logicalPaperId = logicalPaper.getId();
        List<Long> problemIds= paperProblemService.getProblemIdsByLogicalPaperId(logicalPaperId);
        List<ProblemEntity> problems = problemService.selectByIdList(problemIds);

        // 创建一个Map存储每个problemId在problemIds列表中的索引
        Map<Long, Integer> problemIdIndexMap = new HashMap<>();
        for (int i = 0; i < problemIds.size(); i++) {
            problemIdIndexMap.put(problemIds.get(i), i);
        }

        // 使用Comparator对problems列表进行排序
        problems.sort(Comparator.comparingInt(problem -> problemIdIndexMap.get(problem.getId())));

        return problems;
    }

    @Override
    public LogicalPaperEntity updateLogicalPaper(LogicalPaperEntity logicalPaper) {
        LambdaQueryWrapper<LogicalPaperEntity> query = Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(logicalPaper.getId()),LogicalPaperEntity::getId,logicalPaper.getId());
        baseMapper.update(logicalPaper,query);
        return logicalPaper;
    }
    @Override
    public List<PaperEntity> shuffleOrderOfQuestions(Integer num,Long logicalPaperId) {
        LogicalPaperEntity logicalPaper=getById(logicalPaperId);
        PaperEntity paper=paperService.getPapersByLogicalId(logicalPaperId).get(0);
        List<Long> problemIds=paperProblemService.getProblemIdsByLogicalPaperId(logicalPaperId);
        List<ProblemEntity> problems=problemService.selectByIdList(problemIds);
        List<ProblemEntity> choiceProblems=new ArrayList<>();
        List<ProblemEntity> judgeProblems=new ArrayList<>();
        List<ProblemEntity> blankfillingProblems=new ArrayList<>();
        List<ProblemEntity> shortanswerProblems=new ArrayList<>();
        List<PaperEntity> papers=new ArrayList<>();
        papers.add(paper);
        for(ProblemEntity problem:problems)
        {
            String type=problem.getType();
            switch (type)
            {
                case "选择":
                    choiceProblems.add(problem);
                    break;
                case "判断":
                    judgeProblems.add(problem);
                    break;
                case "填空":
                    blankfillingProblems.add(problem);
                    break;
                case "简答":
                    shortanswerProblems.add(problem);
            }
        }
        for (int i=1;i<num;i++)
        {
            Long problemOrder=1L;
            Collections.shuffle(choiceProblems);
            Collections.shuffle(judgeProblems);
            Collections.shuffle(blankfillingProblems);
            Collections.shuffle(shortanswerProblems);

            PaperEntity newpaper =new PaperEntity();
            newpaper.setLogicalPaperId(logicalPaperId);
            paperProblemService.storePaperWithLogicalId(logicalPaperId,newpaper);

            for(ProblemEntity problem:judgeProblems)
            {
                PaperProblemEntity paperProblemEntity=new PaperProblemEntity();
                paperProblemEntity.setPaperId(newpaper.getId());
                paperProblemEntity.setProblemId(problem.getId());
                paperProblemEntity.setPoint(paperProblemService.getPointByPaperIdAndProblemId(paper.getId(),problem.getId()));
                paperProblemEntity.setProblemOrder(problemOrder++);
                paperProblemService.store(paperProblemEntity);
            }
            for(ProblemEntity problem:choiceProblems)
            {
                PaperProblemEntity paperProblemEntity=new PaperProblemEntity();
                paperProblemEntity.setPaperId(newpaper.getId());
                paperProblemEntity.setProblemId(problem.getId());
                paperProblemEntity.setPoint(paperProblemService.getPointByPaperIdAndProblemId(paper.getId(),problem.getId()));
                paperProblemEntity.setProblemOrder(problemOrder++);
                paperProblemService.store(paperProblemEntity);
            }
            for(ProblemEntity problem:blankfillingProblems)
            {
                PaperProblemEntity paperProblemEntity=new PaperProblemEntity();
                paperProblemEntity.setPaperId(newpaper.getId());
                paperProblemEntity.setProblemId(problem.getId());
                paperProblemEntity.setPoint(paperProblemService.getPointByPaperIdAndProblemId(paper.getId(),problem.getId()));
                paperProblemEntity.setProblemOrder(problemOrder++);
                paperProblemService.store(paperProblemEntity);
            }
            for(ProblemEntity problem:shortanswerProblems)
            {
                PaperProblemEntity paperProblemEntity=new PaperProblemEntity();
                paperProblemEntity.setPaperId(newpaper.getId());
                paperProblemEntity.setProblemId(problem.getId());
                paperProblemEntity.setPoint(paperProblemService.getPointByPaperIdAndProblemId(paper.getId(),problem.getId()));
                paperProblemEntity.setProblemOrder(problemOrder++);
                paperProblemService.store(paperProblemEntity);
            }
            papers.add(newpaper);
        }
        return papers;
    }

    @Override
    public List<Long> getLogicalPaperIdsByCourseId(Long courseId) {
        List<Long> logicalPaperIds = new ArrayList<>();
        LambdaQueryWrapper<LogicalPaperEntity> query=Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(courseId),LogicalPaperEntity::getCourseId,courseId);

        List<LogicalPaperEntity> logicalPapers = baseMapper.selectList(query);
        for (LogicalPaperEntity logicalPaper : logicalPapers) {
            logicalPaperIds.add(logicalPaper.getId());
        }
        return logicalPaperIds;
    }
    @Override
    public LogicalPaperEntity storeLogicalPaper(LogicalPaperEntity logicalPaper) {
        baseMapper.insert(logicalPaper);
        return logicalPaper;
    }

    @Override
    public List<Object> updateProblem(Long logicalPaperId, Long problemOrder, Long newProblemId) {
        List<Object> result = new ArrayList<>();
        LogicalPaperEntity logicalPaper=getById(logicalPaperId);
        PaperEntity paper=paperService.getPapersByLogicalId(logicalPaperId).get(0);
        PaperProblemEntity paperProblemEntity=paperProblemService.getPaperProblemEntityByPaperIdAndpProblemOrder(paper.getId(),problemOrder);
        ProblemEntity problem=problemService.getById(paperProblemEntity.getProblemId());
        ProblemEntity newProblem=problemService.getById(newProblemId);
        if(problem.getType().equals(newProblem.getType())) {
            paperProblemEntity.setProblemId(newProblemId);
            paperProblemService.updatePaperProblemEntity(paperProblemEntity);
            logicalPaper.setDifficulty(Double.valueOf(calculateDiffculty(paper.getId())));

            updateLogicalPaper(logicalPaper);

            result.add(logicalPaper);
            result.add(browsePaper(logicalPaperId));
            return result;
        }
        else{

            result.add("题目类型不同，无法修改。");
            return result;
        }

    }
    @Override
    public IPage<LogicalPaperEntity> listAll(Integer curPage, Integer limit) {
        LambdaQueryWrapper<LogicalPaperEntity> query=Wrappers.lambdaQuery();
        query.orderByDesc(LogicalPaperEntity::getId);
        return baseMapper.selectPage(new com.baomidou.mybatisplus.extension.plugins.pagination.Page<>(curPage,limit),query);
    }
}
