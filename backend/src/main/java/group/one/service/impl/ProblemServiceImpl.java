package group.one.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.core.toolkit.ObjectUtils;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import group.one.dao.ProblemDAO;
import group.one.entity.ProblemChoicesEntity;
import group.one.entity.ProblemEntity;
import group.one.entity.ProblemTagEntity;
import group.one.service.ProblemChoicesService;
import group.one.service.ProblemService;
import group.one.utils.Similarity;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import group.one.utils.FileParser;
import group.one.utils.Result;

import java.io.IOException;
import java.io.InputStream;
import java.util.*;
import java.util.stream.Collectors;


@Service("problemService")
public class ProblemServiceImpl extends ServiceImpl<ProblemDAO,ProblemEntity>
        implements ProblemService {
    @Autowired
    public ProblemChoicesService problemChoicesService;

    @Override
    @Transactional
    public  Result insertOne(ProblemEntity problem){
        save(problem);
        List<Map<String,Object>> similarProblem =getSimilarityProblemByOne(problem);
        return Result.success(similarProblem);
    }
    @Override
    @Transactional
    public  Result insertOne(ProblemEntity problem, ProblemChoicesEntity choice){
        save(problem);
        problemChoicesService.insertChoice(choice);
        List<Map<String,Object>> similarProblem =getSimilarityProblemByOne(problem);
        return Result.success(similarProblem);
    }
    @Override
    @Transactional
    public Result insertOne(ProblemEntity problem,List<ProblemChoicesEntity> choices){
        save(problem);
        problemChoicesService.insertChoices(choices);
        List<Map<String,Object>> similarProblem =getSimilarityProblemByOne(problem);
        return Result.success(similarProblem);
    }

    private static final String[] ALLOWED_EXTENSIONS = {".doc", ".docx", ".txt", ".xls", ".xlsx"};

    @Override
    @Transactional
    public Result insertFile(MultipartFile file) {
        try (InputStream inputStream = file.getInputStream()) {
            // 获取文件扩展名
            String fileExtension = FileParser.getFileExtension(file.getOriginalFilename());

            // 解析文件为 List<List<String>>
            List<List<String>> parsedData = FileParser.parseFile(inputStream, fileExtension);

            // 将 List<List<String>> 转换为 List<ProblemEntity>
            List<ProblemEntity> problems = FileParser.convertToProblemEntities(parsedData).getRight();
            List<ProblemChoicesEntity> choices=FileParser.convertToProblemEntities(parsedData).getLeft();


            // 保存到数据库
            for (ProblemEntity problem : problems) {
                save(problem);
            }

            for(ProblemChoicesEntity choice:choices){
                choice.setProblemId(problems.get(choice.getPrblemListIndex()).getId());
            }
            problemChoicesService.insertChoices(choices);

            List<List<Map<String,Object>>> similarProblemList=getSimilarityProblemByList(problems);

            return Result.success(similarProblemList);

        } catch (IOException e) {
            e.printStackTrace();
            return Result.error("文件读取失败: " + e.getMessage());
        } catch (IllegalArgumentException e) {
            e.printStackTrace();
            return Result.error("不支持的文件格式: " + e.getMessage());
        } catch (Exception e) {
            e.printStackTrace();
            return Result.error("文件解析或保存失败: " + e.getMessage());
        }
    }

    @Override
    @Transactional
    public boolean delete(ProblemEntity problem){
        if(!ObjectUtils.isEmpty(problem.getId())){
            removeById(problem.getId());
            return true;
        }
        return false;
    }
    @Override
    @Transactional
    public ProblemEntity update(ProblemEntity problem){
        if (!ObjectUtils.isEmpty(problem.getId())){
            updateById(problem);
        }
        return problem;
    }
    @Override
    @Transactional
    public IPage<ProblemEntity> select(Map<String,Object> params) {
        // 创建分页对象
        LambdaQueryWrapper<ProblemEntity> query = Wrappers.lambdaQuery();
        query.eq(ObjectUtils.isNotEmpty(params.get("id")), ProblemEntity::getId, params.get("id"));
        query.orderByDesc(ProblemEntity::getId);

        int curPage=1;
        int limit=10;
        if(ObjectUtils.isNotEmpty(params.get("id"))) {
            curPage = Integer.parseInt(params.get("id").toString());
        }
        IPage<ProblemEntity> page= Page.of(curPage,limit);
        return baseMapper.selectPage(page,query);
    }
    @Override
    @Transactional
    public List<ProblemEntity> selectList(List<ProblemTagEntity> problemtaglist){
        List<Long> problemIds = problemtaglist.stream()
                .map(ProblemTagEntity::getProblemId)
                .distinct()  // 确保唯一性
                .collect(Collectors.toList());

        LambdaQueryWrapper<ProblemEntity> problemWrapper = Wrappers.<ProblemEntity>lambdaQuery()
                .in(!problemIds.isEmpty(), ProblemEntity::getId, problemIds);

        return list(problemWrapper);
    }

    @Override
    @Transactional
    public List<ProblemEntity> selectByIdList(List<Long> idList){
        if (idList == null ||idList.isEmpty()) {
            return Collections.emptyList(); // 如果 problemIds 为空或 null，直接返回空列表
        }

        // 使用 MyBatis Plus 的 LambdaQueryWrapper 构造查询条件
        LambdaQueryWrapper<ProblemEntity> wrapper = Wrappers.<ProblemEntity>lambdaQuery()
                .in(ProblemEntity::getId, idList); // in 表示 id 在给定的 problemIds 中
        // 执行查询并返回结果
        return list(wrapper);
    }

    @Override
    @Transactional
    public List<ProblemEntity> selectByIdListAndDifficulty(List<Long> problemIds,String difficulty){
        if (problemIds == null || problemIds.isEmpty()) {
            return Collections.emptyList(); // 如果 problemIds 为空或 null，直接返回空列表
        }

        // 使用 MyBatis Plus 的 LambdaQueryWrapper 构造查询条件
        LambdaQueryWrapper<ProblemEntity> wrapper = Wrappers.<ProblemEntity>lambdaQuery()
                .in(ProblemEntity::getId, problemIds) // in 表示 id 在给定的 problemIds 中
                .eq(StringUtils.isNotBlank(difficulty), ProblemEntity::getDifficulty, difficulty); // eq 表示 difficulty 等于给定值

        // 执行查询并返回结果
        return list(wrapper);
    }

    //根据题目ID获得描述
    @Override
    @Transactional
    public List<String> selectDescriptionsByProblemIds(List<Long> problemIds){
        List<ProblemEntity> problemEntities=selectByIdList(problemIds);
        List<String> descriptions = problemEntities.stream()
                .map(ProblemEntity::getDescription) // 假设 getChoiceContent() 返回 String 类型的选择内容
                .collect(Collectors.toList());
        return descriptions;
    }

    //根据题目ID获得题干
    @Override
    @Transactional
    public List<String> selectTitlesByProblemIds(List<Long> problemIds){
        List<ProblemEntity> problemEntities=selectByIdList(problemIds);
        List<String> titles = problemEntities.stream()
                .map(ProblemEntity::getTitle) // 假设 getChoiceContent() 返回 String 类型的选择内容
                .collect(Collectors.toList());
        return titles;
    }

    //根据难度区间获得题干
    @Override
    @Transactional
    public List<String> selectTitlesByDifficultyInterval(String lowerBound,String  upperBound){
        // 创建 LambdaQueryWrapper 并设置查询条件
        LambdaQueryWrapper<ProblemEntity> wrapper = Wrappers.<ProblemEntity>lambdaQuery();

        // 如果上界为空或小于下界，只根据下界查询
        if (StringUtils.isBlank(upperBound) || upperBound.compareTo(lowerBound) < 0) {
            wrapper.eq(ProblemEntity::getDifficulty, lowerBound);
        } else {
            // 正常情况：根据难度区间查询
            wrapper.ge(ProblemEntity::getDifficulty, lowerBound)
                    .le(ProblemEntity::getDifficulty, upperBound);
        }

        // 执行查询并获取符合条件的 ProblemEntity 列表
        List<ProblemEntity> problemList = list(wrapper);

        // 使用 Stream API 提取 title 字段并收集到 List<String>
        List<String> titles = problemList.stream()
                .map(ProblemEntity::getTitle) // 假设有一个方法 getTitle() 返回问题标题
                .collect(Collectors.toList());

        return titles;
    }

    @Override
    @Transactional
    public List<String> selectDescriptionsByDifficultyIntervalAndCourseId(String upperBound,String lowerBound,Long courseId){
        LambdaQueryWrapper<ProblemEntity> wrapper = Wrappers.<ProblemEntity>lambdaQuery();

        if (StringUtils.isBlank(upperBound) || upperBound.compareTo(lowerBound) < 0) {
            wrapper.eq(ProblemEntity::getDifficulty, lowerBound)
                    .eq(ProblemEntity::getCourseId,courseId);
        } else {
            wrapper.ge(ProblemEntity::getDifficulty, lowerBound)
                    .le(ProblemEntity::getDifficulty, upperBound)
                    .eq(ProblemEntity::getCourseId,courseId);
        }

        List<ProblemEntity> problemList = list(wrapper);

        List<String> descriptions = problemList.stream()
                .map(ProblemEntity::getDescription)
                .collect(Collectors.toList());

        return descriptions;
    }

    @Override
    @Transactional
    public List<ProblemEntity> selectByProblemIdListAndCourseId(List<Long> problemIdList,Long courseId){
        LambdaQueryWrapper<ProblemEntity> wrapper = Wrappers.<ProblemEntity>lambdaQuery()
                .in(ProblemEntity::getId,problemIdList)
                .eq(ProblemEntity::getCourseId,courseId);

        return list(wrapper);
    }

    //传入problem查找相似问题list<ProblemEntity>
    @Override
    @Transactional
    public List<Map<String,Object>> getSimilarityProblemByOne(ProblemEntity problem){
        // 使用 LambdaQueryWrapper 构建查询条件，仅根据难度和课程号进行筛选
        LambdaQueryWrapper<ProblemEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemEntity::getDifficulty, problem.getDifficulty())
                .eq(ProblemEntity::getCourseId, problem.getCourseId());

        // 从数据库中筛选出符合条件的题目
        List<ProblemEntity> problems = list(queryWrapper);

        // 定义一个列表来存储相似问题
        List<Map<ProblemEntity, Pair<Long, Long>>> similarProblems = new ArrayList<>();

        // 将目标问题转换为字符串
        String targetProblemString = Similarity.convertProblemToString(problem);
        List<Map<String,Object>> lm=new ArrayList<>();
        // 遍历筛选出的题目，计算相似度
        for (ProblemEntity candidate : problems) {
            Map<String,Object> mapp = new HashMap<>();
            // 将候选问题转换为字符串
            String candidateProblemString = Similarity.convertProblemToString(candidate);

            // 计算相似度
            Pair<Long, Long> similarity = Similarity.calculateSimilarity(targetProblemString, candidateProblemString);
            double jaccardSimilarity = similarity.getLeft() / 10.0;
            double simHashSimilarity = similarity.getRight() / 10.0;

            if (jaccardSimilarity>=20.0&& simHashSimilarity >= 50.0) {
                mapp.put("similarproblem:",candidate);
                mapp.put("Jaccard:", String.format("%.2f%%", jaccardSimilarity));
                mapp.put("SimHash:", String.format("%.2f%%", simHashSimilarity));
                lm.add(mapp);
            }
        }
        return lm;
    }

    @Override
    @Transactional
    public List<List<Map<String,Object>>> getSimilarityProblemByList(List<ProblemEntity> problems){
        List<List<Map<String,Object>>> similarProblemsLists=new ArrayList<>();
        for(ProblemEntity problem:problems){
            similarProblemsLists.add(getSimilarityProblemByOne(problem));
        }
        if(similarProblemsLists.isEmpty()){
            return null;
        }
        else return similarProblemsLists;
    }

    @Override
    @Transactional
    public List<Long> getProblemIdListByCourseId(Long courseId){
        LambdaQueryWrapper<ProblemEntity> queryWrapper = new LambdaQueryWrapper<>();
        queryWrapper.eq(ProblemEntity::getCourseId, courseId);
        List<ProblemEntity> problemEntityList=list(queryWrapper);
        return problemEntityList.stream().
                map(ProblemEntity::getId)
                .collect(Collectors.toList());
    }

    @Override
    @Transactional
    public List<ProblemEntity> getAllProblems(){
        LambdaQueryWrapper<ProblemEntity> wrapper = Wrappers.<ProblemEntity>lambdaQuery();
        List<ProblemEntity> allTags = list(wrapper);
        return allTags;
    }
}


