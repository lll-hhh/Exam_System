package group.one.controller;

import com.fasterxml.jackson.annotation.JsonProperty;
import group.one.entity.LogicalPaperEntity;
import group.one.entity.PaperEntity;
import group.one.entity.PaperTemplateEntity;
import group.one.service.LogicalPaperService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import group.one.utils.Result;

import java.util.List;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping("/logicalpaper")
public class LogicalPaperController {
    @Autowired
    private LogicalPaperService logicalPaperService;

    @GetMapping("/auto-create")
    public autoCreateResponse creatPrompt() {
        return new autoCreateResponse();
    }

    // 内部类定义返回的响应数据结构
    private static class autoCreateResponse {

        @JsonProperty("send")
        private String send = "/auto-creat/{id}";
        @JsonProperty("prompt")
        private String prompt = "请按照以下格式输入模板：";
        @JsonProperty("paperNum")
        private String paperNum = "(int)";
        @JsonProperty("totalScore")
        private String totalScore = "(int)";
        @JsonProperty("choiceNum")
        private String choiceNum = "(int)";
        @JsonProperty("choiceScore")
        private String choiceScore = "(int)";
        @JsonProperty("judgeNum")
        private String judgeNum = "(int)";
        @JsonProperty("judgeScore")
        private String judgeScore = "(int)";
        @JsonProperty("blankfillingNum")
        private String blankfillingNum = "(int)";
        @JsonProperty("blankfillingScore")
        private String blankfillingScore = "(int)";
        @JsonProperty("shortanswerNum")
        private String shortanswerNum = "(int)";
        @JsonProperty("shortanswerScore")
        private String shortanswerScore = "(int)";
        @JsonProperty("course")
        private String course = "(String)";
        @JsonProperty("tagNameList")
        private String tagNameList = "[\"tagName1\",\"tagName2\",\"tagName3\"...]";
        @JsonProperty("difficultyExpectations")
        private String difficultyExpectations = "(int,1~5)";
        @JsonProperty("passRateExpectations")
        private String passRateExpectations = "(double,0~100)";
    }

    @PostMapping("/auto-create")
    public Result<?> autoCreateLogicalPaper(@RequestBody PaperTemplateEntity paperTemplateEntity){
        List<LogicalPaperEntity> logicalPaper=logicalPaperService.autoCreatLogicalPaper(paperTemplateEntity);
        return Result.success(logicalPaper);
    }
    /*
{
    "paperNum" : 1
    "totalScore": 100,
    "choiceNum": 2,
    "choiceScore": 30,
    "judgeNum": 2,
    "judgeScore": 20,
    "blankfillingNum": 2,
    "blankfillingScore": 30,
    "shortanswerNum": 2,
    "shortanswerScore": 20,
    "course": "SjuP课",
    "tagNameList": ["tag名HzP93tabrK"],
    "difficultyExpectations": 3,
    "passRateExpectations": 5
}
     */
    @PostMapping("/browse/{id}")
    public Result<?> browseLogicalPaper(@PathVariable("id") Long id)
    {
        return Result.success(logicalPaperService.browsePaper(id));
    }
    @PostMapping("/shuffle")
    public Result<?> shuffleOrderOfQuestions(@RequestBody Map<String, Object> request) {
        // 从 Map 中提取 num 和 logicalPaperId
        Integer num = (Integer) request.get("num");
        Long logicalPaperId = ((Number) request.get("logicalPaperId")).longValue(); // 防止 JSON 解析为 Integer 类型

        // 调用逻辑，获取打乱后的 Paper 列表
        List<PaperEntity> shuffledPapers = logicalPaperService.shuffleOrderOfQuestions(num, logicalPaperId);

        // 返回成功响应和结果
        return Result.success(shuffledPapers);
    }
    @GetMapping("/shuffle")
    public shufflePrompt creatshufflePrompt()
    {
        return new shufflePrompt();
    }
    private static class shufflePrompt {
        @JsonProperty("prompt")
        private String prompt = "请按照以下格式输入模板：";
        @JsonProperty("num")
        private String num = "(int)";
        @JsonProperty("logicalPaperId")
        private String logicalPaperId = "logicalPaperId";
    }

    @PostMapping("/update")
    public Result<?> update(@RequestBody Map<String, Object> request) {
        // 从 Map 中提取 logicalPaperId、problemOrder 和 newProblemId
        Long logicalPaperId = ((Number) request.get("logicalPaperId")).longValue();  // 转换为 Long 类型
        Long problemOrder = ((Number) request.get("problemOrder")).longValue();
        Long newProblemId = ((Number) request.get("newProblemId")).longValue();
        // 调用业务层的 updateProblem 方法进行更新
        List<Object> updateResult = logicalPaperService.updateProblem(logicalPaperId, problemOrder, newProblemId);
        // 返回更新结果
        return Result.success(updateResult);
    }
    @GetMapping("/update")
    public updatePrompt creatupdatePrompt()
    {
        return new updatePrompt();
    }
    private static class updatePrompt {
        @JsonProperty("prompt")
        private String prompt = "请按照以下格式输入模板：";
        @JsonProperty("num")
        private String num = "(int)";
        @JsonProperty("logicalPaperId")
        private String logicalPaperId = "logicalPaperId";
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
        return Result.success(logicalPaperService.listAll(curPage,limit));
    }
}
