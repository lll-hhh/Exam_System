package group.one.controller;

import group.one.entity.ExamEntity;
import group.one.service.ExamService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import group.one.utils.Result;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/exam")
public class ExamController {
    @Autowired
    private ExamService examService;

    @GetMapping("/list-all")
    public Result<?> listAll(@RequestBody Map<String,Object> params) {
        int curPage=1;
        int limit=5;
        if(params.containsKey("curPage")) {
            curPage = Integer.parseInt(params.get("curPage").toString());
        }
        if(params.containsKey("limit")) {
            limit = Integer.parseInt(params.get("limit").toString());
        }
        return Result.success(examService.listAll(curPage,limit));
    }

    @GetMapping("/get-by-id/{id}")
    public Result<ExamEntity> getById(@PathVariable("id") Long id) {
        return Result.success(examService.getById(id));
    }

    @PostMapping("/add")
    public Result<ExamEntity> add(@RequestBody ExamEntity examEntity) {
        examService.add(examEntity);
        return Result.success(examEntity);
    }

    @GetMapping("/delete-by-id/{id}")
    public Result<Void> delete(@PathVariable("id") Long id) {
        if(examService.removeById(id))
            return Result.success();
        else
            return Result.error();
    }

    @PostMapping("/update/{id}")
    public Result<ExamEntity> update(@PathVariable("id") Long id,@RequestBody ExamEntity examEntity) {
        return Result.success(examService.modifyById(id,examEntity));
    }
}