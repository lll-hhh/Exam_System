package group.one.utils;

import group.one.entity.ProblemChoicesEntity;
import group.one.entity.ProblemEntity;
import org.apache.commons.lang3.tuple.Pair;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.extractor.WordExtractor;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.apache.poi.xwpf.usermodel.XWPFDocument;
import org.apache.poi.xwpf.usermodel.XWPFParagraph;

import java.io.BufferedReader;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class FileParser {

    public static Pair<List<ProblemChoicesEntity>,List<ProblemEntity>> convertToProblemEntities(List<List<String>> parsedData) {

        List<ProblemEntity> problems = new ArrayList<>();
        List<ProblemChoicesEntity> choices = new ArrayList<>();
        int problemListIndex = 0;
        for (List<String> row : parsedData) {

            if (row.size() >= 7) {  // 确保至少有 6 个单元格
                // 创建一个新的 ProblemEntity 对象，并设置各个字段
                ProblemEntity problem = new ProblemEntity();
                problem.setType(row.get(0));  // 类型
                problem.setTitle(row.get(1));  // 题干
                problem.setDescription(row.get(2));  // 题目描述
                problem.setDifficulty(row.get(3));  // 难度等级
                Long courseId = Math.round(Double.parseDouble(row.get(4)));
                problem.setCourseId(courseId);  // 课程ID
                problem.setImgUrl(row.get(5));  // 图片链接

                String optionsStr = row.get(6);


                if (optionsStr != null && !optionsStr.isEmpty()) {
                    switch (row.get(0)) {
                        case "选择":
                            handleMultipleChoice(problem, optionsStr, choices,problemListIndex);
                            break;
                        case "判断":
                            handleTrueFalse(problem, optionsStr, choices,problemListIndex);
                            break;
                        case "简答":
                            shortAnswerChoice(problem,optionsStr, choices,problemListIndex);
                            break;
                        case "填空":
                            shortAnswerChoice(problem,optionsStr, choices,problemListIndex);
                            break;
                        default:
                            // 处理未知类型
                            System.out.println("未知问题类型: " + row.get(0));
                            break;
                    }
                }
                problemListIndex++;
                // 添加到问题列表
                problems.add(problem);
            }
        }
        return Pair.of(choices,problems);
    }

    private static void handleMultipleChoice(ProblemEntity problem, String optionsStr, List<ProblemChoicesEntity> choices,int index) {
        String[] options = optionsStr.split("\\$\\$", -1); // 使用正则表达式分割选项
        for (int i = 0; i < options.length; i++) {
            ProblemChoicesEntity choice = new ProblemChoicesEntity();
            choice.setChoice(options[i]); // 选项内容
            choice.setIsAnswer(i == 0 ? "1" : "0"); // 第一个选项为正确答案
            choice.setPrblemListIndex(index);
            choices.add(choice);
        }
    }

    private static void handleTrueFalse(ProblemEntity problem, String optionsStr, List<ProblemChoicesEntity> choices,int index) {
        String[] options = optionsStr.split("\\$\\$", -1); // 使用正则表达式分割选项
        if (options.length == 2) { // 第一个为正确答案，后面两个为选项
            for (int i = 0; i < options.length; i++) {
                ProblemChoicesEntity choice = new ProblemChoicesEntity();
                choice.setChoice(options[i]); // 选项内容
                choice.setIsAnswer(i == 0 ? "1" : "0"); // 第一个选项为正确答案
                choice.setPrblemListIndex(index);
                choices.add(choice);
            }
        } else {
            System.out.println("判断题选项格式不正确: " + optionsStr);
        }
    }

    private static void shortAnswerChoice(ProblemEntity problem, String optionsStr, List<ProblemChoicesEntity> choices,int index) {
            ProblemChoicesEntity choice = new ProblemChoicesEntity();
            choice.setChoice(optionsStr); // 选项内容
            choice.setIsAnswer(optionsStr.toString()); // 第一个选项为正确答案
            choice.setPrblemListIndex(index);
            choices.add(choice);
    }
    /**
     * 根据文件扩展名解析文件（通过文件路径）
     *
     * @param filePath 文件路径
     * @return 题目列表，每个题目是一个包含 7 行文本或单元格的 List<String>
     * @throws IOException 如果文件读取或解析失败
     */
    public static List<List<String>> parseFile(String filePath) throws IOException {
        try (InputStream inputStream = new FileInputStream(filePath)) {
            return parseFile(inputStream, getFileExtension(filePath));
        }
    }

    /**
     * 根据文件扩展名解析文件（通过输入流）
     *
     * @param inputStream 输入流
     * @param fileExtension 文件扩展名（带点）
     * @return 题目列表
     * @throws IOException 如果文件读取或解析失败
     */
    public static List<List<String>> parseFile(InputStream inputStream, String fileExtension) throws IOException {
        switch (fileExtension.toLowerCase()) {
            case ".txt":
                return parseTxtFile(inputStream);  // 返回 List<List<String>>
            case ".doc":
                return parseDocFile(inputStream);  // 返回 List<List<String>>
            case ".docx":
                return parseDocxFile(inputStream);  // 返回 List<List<String>>
            case ".xls":
                return parseXlsFile(inputStream);  // 返回 List<List<String>>
            case ".xlsx":
                return parseXlsxFile(inputStream);  // 返回 List<List<String>>
            default:
                throw new IllegalArgumentException("不支持的文件格式: " + fileExtension);
        }
    }
    /**
     * 解析 .txt 文件，并按 7 行分组，每 7 行作为一个题目
     *
     * @param inputStream 输入流
     * @return 题目列表，每个题目是一个包含 7 行文本的 List<String>
     * @throws IOException 如果文件读取或解析失败
     */
    private static List<List<String>> parseTxtFile(InputStream inputStream) throws IOException {
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            List<List<String>> allQuestions = new ArrayList<>();
            List<String> currentQuestion = new ArrayList<>();
            String line;

            while ((line = reader.readLine()) != null) {
                String trimmedLine = line.trim();
                if (!trimmedLine.isEmpty()) {
                    currentQuestion.add(trimmedLine);

                    if (currentQuestion.size() == 7) {
                        allQuestions.add(currentQuestion);
                        currentQuestion = new ArrayList<>();
                    }
                }
            }

            if (!currentQuestion.isEmpty()) {
                allQuestions.add(currentQuestion);
            }

            return allQuestions;
        }
    }

    /**
     * 解析 .doc 文件，并按 7 行分组，每 7 行作为一个题目
     *
     * @param inputStream 输入流
     * @return 题目列表，每个题目是一个包含 7 行文本的 List<String>
     * @throws IOException 如果文件读取或解析失败
     */
    public static List<List<String>> parseDocFile(InputStream inputStream) throws IOException {
        try (POIFSFileSystem fs = new POIFSFileSystem(inputStream);
             HWPFDocument doc = new HWPFDocument(fs)) {

            WordExtractor extractor = new WordExtractor(doc);
            String[] paragraphs = extractor.getParagraphText();

            List<List<String>> allQuestions = new ArrayList<>();

            for (int i = 0; i < paragraphs.length; i += 7) {
                List<String> question = new ArrayList<>();

                for (int j = 0; j < 7 && i + j < paragraphs.length; j++) {
                    String line = paragraphs[i + j].trim();
                    if (!line.isEmpty()) {
                        question.add(line);
                    }
                }

                if (!question.isEmpty()) {
                    allQuestions.add(question);
                }
            }

            return allQuestions;
        }
    }
    /**
     * 解析 .docx 文件，并按 7 行分组，每 7 行作为一个题目
     *
     * @param inputStream 输入流
     * @return 题目列表，每个题目是一个包含 7 行文本的 List<String>
     * @throws IOException 如果文件读取或解析失败
     */
    public static List<List<String>> parseDocxFile(InputStream inputStream) throws IOException {
        try (XWPFDocument document = new XWPFDocument(inputStream)) {
            // 获取所有段落
            List<XWPFParagraph> paragraphs = document.getParagraphs();

            // 创建一个主列表来存储所有题目
            List<List<String>> allQuestions = new ArrayList<>();

            // 创建一个临时列表来存储当前题目
            List<String> currentQuestion = new ArrayList<>();

            // 遍历所有段落
            for (XWPFParagraph paragraph : paragraphs) {
                String text = paragraph.getText().trim();
                if (!text.isEmpty()) {
                    currentQuestion.add(text);

                    // 每 7 行作为一个题目
                    if (currentQuestion.size() == 7) {
                        allQuestions.add(currentQuestion);
                        currentQuestion = new ArrayList<>();  // 重置当前题目
                    }
                }
            }

            // 如果最后一组题目不足 7 行，也添加到结果中
            if (!currentQuestion.isEmpty()) {
                allQuestions.add(currentQuestion);
            }

            return allQuestions;
        }
    }/**
     * 解析 .xls 文件，并按 7 个单元格分组，每行一题
     *
     * @param inputStream 输入流
     * @return 题目列表，每个题目是一个包含 7个单元格的 List<String>
     * @throws IOException 如果文件读取或解析失败
     */
    private static List<List<String>> parseXlsFile(InputStream inputStream) throws IOException {
        try (Workbook workbook = new HSSFWorkbook(inputStream)) {
            return parseWorkbook(workbook);
        }
    }

    /**
     * 解析 .xlsx 文件，并按 7个单元格分组，每行一题
     *
     * @param inputStream 输入流
     * @return 题目列表，每个题目是一个包含 7 个单元格的 List<String>
     * @throws IOException 如果文件读取或解析失败
     */
    private static List<List<String>> parseXlsxFile(InputStream inputStream) throws IOException {
        try (Workbook workbook = new XSSFWorkbook(inputStream)) {
            return parseWorkbook(workbook);
        }
    }

    /**
     * 解析 Excel 工作簿（适用于 .xls 和 .xlsx 文件），并按 7 个单元格分组，每行一题
     *
     * @param workbook 工作簿
     * @return 题目列表，每个题目是一个包含 7 个单元格的 List<String>
     */
    private static List<List<String>> parseWorkbook(Workbook workbook) {
        List<List<String>> allQuestions = new ArrayList<>();

        for (Sheet sheet : workbook) {
            for (Row row : sheet) {
                // 检查行是否为空
                if (isRowEmpty(row)) {
                    continue;  // 跳过空行
                }

                // 获取该行的 7 个单元格，不足 7 个则填充空字符串
                List<String> question = new ArrayList<>();
                for (int i = 0; i < 7; i++) {
                    Cell cell = row.getCell(i, Row.MissingCellPolicy.CREATE_NULL_AS_BLANK);
                    String cellValue = getCellValueAsString(cell).trim();
                    question.add(cellValue);
                }

                // 将当前行的 7 个单元格作为一个题目添加到结果中
                allQuestions.add(question);
            }
        }

        return allQuestions;
    }

    /**
     * 判断一行是否为空
     *
     * @param row 行对象
     * @return 如果行中的所有单元格都是空的，则返回 true；否则返回 false
     */
    private static boolean isRowEmpty(Row row) {
        for (Cell cell : row) {
            if (cell != null && !getCellValueAsString(cell).trim().isEmpty()) {
                return false;
            }
        }
        return true;
    }

    /**
     * 获取单元格的值并转换为字符串
     *
     * @param cell 单元格对象
     * @return 单元格的字符串表示
     */
    private static String getCellValueAsString(Cell cell) {
        switch (cell.getCellType()) {
            case STRING:
                return cell.getStringCellValue();
            case NUMERIC:
                if (DateUtil.isCellDateFormatted(cell)) {
                    return cell.getDateCellValue().toString();
                } else {
                    return String.valueOf(cell.getNumericCellValue());
                }
            case BOOLEAN:
                return String.valueOf(cell.getBooleanCellValue());
            case FORMULA:
                return cell.getCellFormula();
            case BLANK:
                return "";
            default:
                return "";
        }
    }
    /**
     * 获取文件扩展名
     *
     * @param filePath 文件路径
     * @return 文件扩展名（带点）
     */
    public static String getFileExtension(String filePath) {
        if (filePath == null || filePath.isEmpty()) {
            return "";
        }
        int lastDotIndex = filePath.lastIndexOf('.');
        return lastDotIndex == -1 ? "" : filePath.substring(lastDotIndex).toLowerCase();
    }
}