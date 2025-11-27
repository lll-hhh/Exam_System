package group.one.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import group.one.entity.ProblemEntity;
import group.one.entity.ProblemTagEntity;
import group.one.entity.TagEntity;
import group.one.service.ProblemService;
import group.one.service.ProblemTagService;
import group.one.service.TagService;
import lombok.extern.slf4j.Slf4j;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import group.one.utils.Result;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/problem-tag")
public class ProblemTagController {
    @Autowired
    private ProblemTagService problemtagservice;

    @Autowired
    private TagService tagService;

    @Autowired
    private ProblemService problemService;

    @PostMapping("/insert")
    public Result problemTagInsert(@RequestBody ProblemTagEntity problemtag) {
        return Result.success(problemtagservice.insert(problemtag));
    }
    @PostMapping("/delete")
    public Result problemTagDelete(@RequestBody ProblemTagEntity problemtag){
        return  Result.success(problemtagservice.delete(problemtag));
    }

    @PostMapping("/select-by-problem")
    public Result selectByProblem(
            @RequestBody Map<String ,Object> params){

        Long problemId=Long.valueOf(params.get("problemId").toString());
        int current=1;
        int size =5;
        if(params.containsKey("current")){
            current=Integer.parseInt(params.get("current").toString());
        }
        if(params.containsKey("size")){
            size=Integer.parseInt(params.get("size").toString());
        }
        // 从服务层获取所有与 problemId 相关的 ProblemTagEntity
        List<ProblemTagEntity> allTags = problemtagservice.selectByProblem(problemId);

        // 如果没有数据，直接返回空分页结果
        if (allTags.isEmpty()) {
            return Result.success(new Page<>());
        }

        // 计算总记录数
        long total = allTags.size();

        // 计算起始索引和结束索引
        int start = (current - 1) * size;
        int end = Math.min(start + size, (int) total);

        // 截取分页后的数据
        List<ProblemTagEntity> pageData = allTags.subList(Math.max(0, start), end);

        // 创建 IPage 对象并设置分页信息
        IPage<ProblemTagEntity> page = new Page<>(current, size, total);
        page.setRecords(pageData);

        // 返回分页结果
        return Result.success(page);
    }

    @PostMapping("/get-problems-by-tag-id")
    public Result getProblemsByTagId( @RequestBody Map<String ,Object> params){
        Long tagId=Long.valueOf(params.get("tagId").toString());
        int current=1;
        int size =5;
        if(params.containsKey("current")){
            current=Integer.parseInt(params.get("current").toString());
        }
        if(params.containsKey("size")){
            size=Integer.parseInt(params.get("size").toString());
        }
        // 从服务层获取所有与 problemId 相关的 ProblemTagEntity
        List<ProblemTagEntity> problems = problemtagservice.selectByProblem(tagId);


        List<ProblemEntity>allTags =problemService.selectByIdList(problems.stream().map(ProblemTagEntity::getTagId).collect(Collectors.toList()));
        // 如果没有数据，直接返回空分页结果
        if (allTags.isEmpty()) {
            return Result.success(new Page<>());
        }

        // 计算总记录数
        long total = allTags.size();

        // 计算起始索引和结束索引
        int start = (current - 1) * size;
        int end = Math.min(start + size, (int) total);

        // 截取分页后的数据
        List<ProblemEntity> pageData = allTags.subList(Math.max(0, start), end);

        // 创建 IPage 对象并设置分页信息
        IPage<ProblemEntity> page = new Page<>(current, size, total);
        page.setRecords(pageData);

        // 返回分页结果
        return Result.success(page);
    }
    @PostMapping("/get-tags-by-problem-id")
    public Result getTagsByProblemId( @RequestBody Map<String ,Object> params){
        Long problemId=Long.valueOf(params.get("problemId").toString());
        int current=1;
        int size =5;
        if(params.containsKey("current")){
            current=Integer.parseInt(params.get("current").toString());
        }
        if(params.containsKey("size")){
            size=Integer.parseInt(params.get("size").toString());
        }
        // 从服务层获取所有与 problemId 相关的 ProblemTagEntity
        List<ProblemTagEntity> Tags = problemtagservice.selectByProblem(problemId);


        List<TagEntity>allTags =tagService.selectByIdList(Tags.stream().map(ProblemTagEntity::getTagId).collect(Collectors.toList()));
        // 如果没有数据，直接返回空分页结果
        if (allTags.isEmpty()) {
            return Result.success(new Page<>());
        }

        // 计算总记录数
        long total = allTags.size();

        // 计算起始索引和结束索引
        int start = (current - 1) * size;
        int end = Math.min(start + size, (int) total);

        // 截取分页后的数据
        List<TagEntity> pageData = allTags.subList(Math.max(0, start), end);

        // 创建 IPage 对象并设置分页信息
        IPage<TagEntity> page = new Page<>(current, size, total);
        page.setRecords(pageData);

        // 返回分页结果
        return Result.success(page);
    }
    @PostMapping("/select-by-tag")
    public Result selectByTag(@RequestBody Map<String ,Object> params){

        Long tagId=Long.valueOf(params.get("tagId").toString());
        int current=1;
        int size =5;
        if(params.containsKey("current")){
            current=Integer.parseInt(params.get("current").toString());
        }
        if(params.containsKey("size")){
            size=Integer.parseInt(params.get("size").toString());
        }
        // 从服务层获取所有与 problemId 相关的 ProblemTagEntity
        List<ProblemTagEntity> allTags = problemtagservice.selectByTag(tagId);

        // 如果没有数据，直接返回空分页结果
        if (allTags.isEmpty()) {
            return Result.success(new Page<>());
        }

        // 计算总记录数
        long total = allTags.size();

        // 计算起始索引和结束索引
        int start = (current - 1) * size;
        int end = Math.min(start + size, (int) total);

        // 截取分页后的数据
        List<ProblemTagEntity> pageData = allTags.subList(Math.max(0, start), end);

        // 创建 IPage 对象并设置分页信息
        IPage<ProblemTagEntity> page = new Page<>(current, size, total);
        page.setRecords(pageData);

        // 返回分页结果
        return Result.success(page);
    }
}