package group.one.controller;

import group.one.entity.SessionEntity;
import group.one.service.SessionService;
import group.one.service.UserAnswerService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import group.one.utils.Result;

import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/session")
public class SessionController {
    @Autowired
    private SessionService sessionService;

    @Autowired
    private UserAnswerService userAnswerService;
//    @Autowired
//    private ExamService examService;

    @GetMapping("/query/{id}")
    public String query(@PathVariable("id") Long id) {
        return sessionService.querySessionData(id);
    }

    @PostMapping("/list-all")
    public Result<?> listALl(@RequestBody Map<String,Object> params) {
        int curPage=1;
        int limit=5;
        if(params.containsKey("curPage")) {
            curPage = Integer.parseInt(params.get("curPage").toString());
        }
        if(params.containsKey("limit")) {
            limit = Integer.parseInt(params.get("limit").toString());
        }
        return Result.success(sessionService.listAll(curPage,limit));
    }

    @GetMapping("/get-by-id/{id}")
    public Result<SessionEntity> getById(@PathVariable("id") Long id) {
        return Result.success(sessionService.getById(id));
    }

    @PostMapping("/add")
    public Result<SessionEntity> add(@RequestBody SessionEntity sessionEntity) {
        sessionService.add(sessionEntity);
        return Result.success(sessionEntity);
    }

    @DeleteMapping("/delete-by-id/{id}")
    public Result<Void> delete(@PathVariable("id") Long id) {
        return sessionService.removeById(id)?Result.success():Result.error();
    }

    @PostMapping("/update-by-id/{id}")
    public Result<SessionEntity> update(@PathVariable("id") Long id,@RequestBody SessionEntity sessionEntity) {
        return Result.success(sessionService.modifyById(id,sessionEntity));
    }

    @GetMapping("/judge/{id}")
    public Result<SessionEntity> judge(@PathVariable("id") Long id) {
        return Result.success(sessionService.autoJudge(id));
    }

    @PostMapping("/answer/{sessionId}")
    public Result<?> answer(@PathVariable("sessionId") Long sessionId,@RequestBody Map<String,Object> params) {
        if(!sessionService.isTimeValid(sessionId)) {
            return Result.error("Session not started or already ended");
        }
        if(!params.containsKey("problemId")) {
            return Result.error(400,"problem id is required");
        }
        Long problemId = Long.parseLong(params.get("problemId").toString());
        if(!params.containsKey("answer")) {
            return Result.error(400,"answer is required");
        }
        String answer = params.get("answer").toString();
        return Result.success(userAnswerService.setAnswer(sessionId,problemId,answer));
    }

}
