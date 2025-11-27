package group.one.controller;

import group.one.entity.ResponseMessage;
import group.one.entity.WrongProblemEntity;
import group.one.service.WrongProblemService;
import group.one.service.impl.ProblemServiceImpl;
import group.one.service.impl.ProblemTagServiceImpl;
import group.one.service.impl.TagServiceImpl;
import group.one.utils.Result;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Slf4j
@RestController
@RequestMapping("/wrong-problem")
public class WrongProblemController {

    /**
     * 本Controller需要的基本json格式为
     * {
     *     "userId": 1,
     *     "problemId": 1,
     *     "note": "这是一个笔记",
     *     "n":1
     *     }
     * 其中n为返回n道错题,userId为用户id,problemId为错题id,note为笔记
     */
    @Qualifier("WrongProblemService")
    @Autowired
    private WrongProblemService service;
    @Autowired
    private TagServiceImpl tagService;
    @Autowired
    private ProblemTagServiceImpl problemTagService;
    @Autowired
    private ProblemServiceImpl problemService;

    /**
     * 收藏错题
     * @param wrongProblem
     * @return
     */
    @PostMapping
    public ResponseMessage add(@Validated @RequestBody WrongProblemEntity wrongProblem){//提示传入文本
        service.add(wrongProblem);
        return ResponseMessage.success(wrongProblem);
    }

    /**
     * 删除用户的错题
     * @param problemId
     * @param wrongProblem
     * @return
     */
    @DeleteMapping("/{problemId}")
    public ResponseMessage delete(@PathVariable("problemId") Long problemId,@Validated @RequestBody WrongProblemEntity wrongProblem){
        Long userId = wrongProblem.getUserId();
        service.deleteByProblemId(userId,problemId);
        return ResponseMessage.success(wrongProblem);
    }

    /**
     * 获取n个错误题
     * @param params
     * @return
     */
    @PostMapping("/get-problems/{n}")
    public WrongProblemEntity getNProblems(@PathVariable("n") Long n,@RequestBody Map<String, Object> params) {

        WrongProblemEntity entity = new WrongProblemEntity();
        Long userId = Long.valueOf(params.get("userId").toString());
        Long courseId = Long.valueOf(params.get("courseId").toString());
        List<Long> problemIds = service.getNProblems(userId, courseId, n);
        List<String> problemTitles=problemService.selectTitlesByProblemIds(problemIds);
        entity.setWrongProblemExercises(problemTitles);
        entity.setUserId(userId);
        return entity;
    }

    /**
     *展示用户错误题目对应的tag和题目本身
     */
    @PostMapping("/show-users-tags")
    public WrongProblemEntity showIt(@RequestBody WrongProblemEntity wrongProblem) {
        Long problemId = wrongProblem.getProblemId();
        List<Long> wrongProblemTagIds = problemTagService.getTagIdsByProblemId(problemId);
        log.debug("wrongProblemTagIds: "+wrongProblemTagIds);
        List<String> wrongTags=tagService.getTagNamesByTagIds(wrongProblemTagIds);
        wrongProblem.setWrongTags(wrongTags);
        wrongProblem.setProblemId(problemId);
        return wrongProblem;
    }

    /**
     *展示用户错误题目对应的题目描述和本身
     */
    @PostMapping("/show-users-desc")
    public WrongProblemEntity showDesc(@RequestBody WrongProblemEntity wrongProblem) {
        Long problemId = wrongProblem.getProblemId();
        Integer n = wrongProblem.getN();
        List<String> description=service.getProblemDescriptions(wrongProblem.getUserId(), wrongProblem.getCourseId(), n==0?1: n);
        wrongProblem.setWrongProblemExercisesDesc(description);
        return wrongProblem;
    }

    /**
     * 新增错题笔记
     * @param wrongProblem
     * @return
     */
    @PostMapping("/add-note")
    public WrongProblemEntity addNote(@RequestBody WrongProblemEntity wrongProblem) {
        service.addNote(wrongProblem.getUserId(),wrongProblem.getProblemId(),wrongProblem.getNote());
        return wrongProblem;
    }

    /**
     * 获取错误题笔记
     * @param wrongProblem
     * @return
     */
    @PostMapping("/find-note")
    public WrongProblemEntity findNote(@RequestBody WrongProblemEntity wrongProblem) {
        return service.findNote(wrongProblem.getUserId(),wrongProblem.getProblemId());
    }

    /**
     * 自动分页查询
     * @param params
     * @return
     */
    @PostMapping("/list-all")
    public Result<?> listAll(@RequestBody Map<String,Object> params) {
        int curPage=1;
        int limit=5;
        if(params.containsKey("curPage")) {
            curPage = Integer.parseInt(params.get("curPage").toString());
        }
        if(params.containsKey("limit")) {
            limit = Integer.parseInt(params.get("limit").toString());
        }
        return Result.success(service.listAll(curPage,limit));
    }

    /**
     *  根据用户和学科展示其近N个错题知识点
     */
    @PostMapping("/show-all-tags")  //根据用户和学科展示其所有的错题知识点
    public WrongProblemEntity showAllTags(@RequestBody WrongProblemEntity wrongProblem) {
        Long userId = wrongProblem.getUserId();
        Long courseId = wrongProblem.getCourseId();
        Integer n = wrongProblem.getN();
        List <Long> problemIds=service.getNProblems(userId, courseId,Long.valueOf(n));
        List<Long> wrongProblemTagIds=new ArrayList<>();
        for(Long problemId:problemIds) {
            wrongProblemTagIds.addAll( problemTagService.getTagIdsByProblemId(problemId));
        }
        //去重
        wrongProblemTagIds = wrongProblemTagIds.stream().distinct().collect(Collectors.toList());
        List<String> wrongTags=tagService.getTagNamesByTagIds(wrongProblemTagIds);
        wrongProblem.setWrongTags(wrongTags);
        return wrongProblem;
    }

    /**
     * 其余的CRUD操作
     * @param wrongProblem
     * @return
     */
    @GetMapping("/{userId}")
    public Object ResponseMessage (@Validated @RequestBody WrongProblemEntity wrongProblem){//提示传入文本
        service.get(wrongProblem);
        return ResponseMessage.success(wrongProblem);
    }
    @PutMapping
    public ResponseMessage edit(@Validated @RequestBody WrongProblemEntity wrongProblem){
        service.change(wrongProblem);
        return ResponseMessage.success(wrongProblem);
    }

}
