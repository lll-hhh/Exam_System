package group.one.service.impl;

import group.one.entity.TagEntity;
import group.one.service.AnalyseUserService;
import group.one.service.ProblemTagService;

import java.util.*;
import java.util.stream.Collectors;
import java.util.stream.IntStream;

public class AnalyseUserServiceImpl implements AnalyseUserService {

    public Integer getAverage(List<Integer> numbers) {
        return (int) numbers.stream()
                .mapToInt(Integer::intValue)
                .average()
                .orElse(0.0); // 如果没有分数，返回0.0
    }

    // 求最高分的方法
    @Override
    public Integer getHighest(List<Integer> numbers) {
        return numbers.stream()
                .max(Integer::compareTo)
                .orElse(null);
    }

    // 求最低分的方法
    @Override
    public Integer getLowest(List<Integer> numbers) {
        return numbers.stream()
                .min(Integer::compareTo)
                .orElse(null);
    }

    @Override
    public Integer getPassRate(List<Integer> sortedScores) {
        int total = sortedScores.size();
        int passCount = (int) sortedScores.stream().filter(score -> score >= 60).count();
        return (int) Math.round((double) passCount / total * 100);
    }


    public Map<Integer, Integer> getRank(List<Integer> numbers) {

        List<Map.Entry<Integer, Integer>> scoreWithIndex = IntStream.range(0, numbers.size())
                .mapToObj(i -> new AbstractMap.SimpleEntry<>(numbers.get(i), i + 1)) // 索引从1开始
                .sorted(Map.Entry.<Integer, Integer>comparingByValue().reversed()) // 按分数降序排序
                .collect(Collectors.toList());
        Map<Integer, Integer> rankMap = new LinkedHashMap<>();
        int currentRank = 1;
        int previousScore = -1;

        for (Map.Entry<Integer, Integer> entry : scoreWithIndex) {
            int score = entry.getKey();
            if (score != previousScore) {
                currentRank = entry.getValue();
            }
            rankMap.put(score, currentRank);
            previousScore = score;
        }


        return rankMap;
    }


    public static void main(String[] args) {
        AnalyseUserServiceImpl analysis = new AnalyseUserServiceImpl();
        List<Integer> scores = Arrays.asList(100, 90, 90, 80);
        System.out.println("Average: " + analysis.getAverage(scores));
        System.out.println("Highest: " + analysis.getHighest(scores));
        System.out.println("Lowest: " + analysis.getLowest(scores));
        System.out.println("Rank: " + analysis.getRank(scores));
    }
}