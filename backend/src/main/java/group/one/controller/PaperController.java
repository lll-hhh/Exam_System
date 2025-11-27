package group.one.controller;

import group.one.entity.PaperEntity;
import group.one.service.PaperService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import group.one.utils.Result;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/paper")
public class PaperController {
    @Autowired
    private PaperService paperService;
    @PostMapping("/get-by-id/{id}")
    public Result searchPaper(@PathVariable("id") Long id){

        Result<?> response = Result.success(paperService.getById(id));
        return response;
    }
    @PostMapping("/delete-by-id/{id}")
    public Result deletePaper(@PathVariable("id") Long id){

        Result<?> response = Result.success(paperService.deleteById(id));
        return response;
    }
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
        return Result.success(paperService.listAll(curPage,limit));
    }
    @PostMapping("/browse/{id}")
    public Result browsePaper(@PathVariable("id") Long id)
    {
        return Result.success(paperService.browsePaper(id));
    }
}
