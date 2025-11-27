package group.one.utils;

import com.hankcs.hanlp.HanLP;
import com.hankcs.hanlp.seg.common.Term;
import group.one.entity.ProblemEntity;
import org.apache.commons.lang3.tuple.Pair;

import java.math.BigInteger;
import java.util.*;

public class Similarity {
    private static final int SIMILARITY_MULTIPLIER = 1000; // 用于将浮点数转换为 Long 类型
    public static String convertProblemToString(ProblemEntity problem) {
        StringBuilder sb = new StringBuilder();
        sb.append(problem.getTitle()); // 题目内容
        sb.append(" ").append(problem.getDescription());
        sb.append(problem.getCourseId()).append(problem.getType());// 选项
        // 如果有其他需要参与相似度计算的字段，可以继续追加
        return sb.toString();
    }
    /**
     * 计算两种相似度：Jaccard 相似性系数和 SimHash 相似度，并返回 Long 类型的结果
     *
     * @param document1 第一个文档
     * @param document2 第二个文档
     * @return Pair<Long, Long>，第一个元素是 Jaccard 相似性系数，第二个元素是 SimHash 相似度
     */
    public static Pair<Long, Long> calculateSimilarity(String document1, String document2) {
        // 清洗文本，去除特殊字符
        document1 = cleanText(document1);
        document2 = cleanText(document2);

        // 计算 Jaccard 相似性系数
        double jaccardSimilarity = getSimilarity(document1, document2);
        long jaccardLong = Math.round(jaccardSimilarity * SIMILARITY_MULTIPLIER);

        // 计算 SimHash 相似度
        MySimHash hash1 = new MySimHash(document1, 64);
        MySimHash hash2 = new MySimHash(document2, 64);
        double simHashSimilarity = hash1.getSemblance(hash2);
        long simHashLong = Math.round(simHashSimilarity * SIMILARITY_MULTIPLIER);

        // 使用 Pair.of() 创建 Pair 实例
        return Pair.of(jaccardLong, simHashLong);
    }

    /**
     * 计算 Jaccard 相似性系数
     *
     * @param document1 第一个文档
     * @param document2 第二个文档
     * @return Jaccard 相似性系数
     */
    private static double getSimilarity(String document1, String document2) {
        // 使用 HanLP 进行分词
        List<String> wordslist1 = getWords(document1);
        List<String> wordslist2 = getWords(document2);
        Set<String> words2Set = new HashSet<>(wordslist2);

        // 求交集
        Set<String> intersectionSet = new HashSet<>();
        for (String word : wordslist1) {
            if (words2Set.contains(word)) {
                intersectionSet.add(word);
            }
        }

        // 交集的大小
        int intersectionSize = intersectionSet.size();

        // 求并集
        Set<String> unionSet = new HashSet<>(wordslist1);
        unionSet.addAll(wordslist2);

        // 并集的大小
        int unionSize = unionSet.size();

        // 相似度分值
        return unionSize == 0 ? 0.0 : (double) intersectionSize / unionSize;
    }

    /**
     * 使用 HanLP 进行分词，并过滤停用词
     *
     * @param text 输入文本
     * @return 分词后的词语列表
     */
    private static List<String> getWords(String text) {
        // 使用 HanLP 进行分词
        List<Term> termList = HanLP.segment(text);

        // 定义停用词表（可以根据需要扩展）
        Set<String> stopWords = new HashSet<>(Arrays.asList(
                "的", "了", "和", "是", "在", "我", "有", "不", "人", "都", "一", "一个", "上", "也", "很", "到", "说", "要", "去", "可以", "你", "会", "着", "就", "没有", "看", "好", "出来", "这", "它", "把", "我们", "自己", "出去", "里面"
        ));

        // 过滤掉停用词
        List<String> words = new ArrayList<>();
        for (Term term : termList) {
            String word = term.word.trim();
            if (!word.isEmpty() && !stopWords.contains(word)) {
                words.add(word.toLowerCase());  // 转换为小写以确保一致性
            }
        }

        return words;
    }

    /**
     * 清除特殊字符，保留纯文本
     *
     * @param content 输入文本
     * @return 清洗后的文本
     */
    private static String cleanText(String content) {
        // 去除多余空格和标点符号
        return content.replaceAll("[\\s\\p{Punct}]+", " ").trim();  // 将所有标点符号和多余空格替换为单个空格
    }

    // MySimHash 类的简化版本，用于计算 SimHash 相似度
    private static class MySimHash {
        private String tokens; // 字符串
        private final BigInteger strSimHash; // 字符串的 SimHash 值
        private int hashbits = 64; // 分词后的 hash 数

        public MySimHash(String tokens, int hashbits) {
            this.tokens = tokens;
            this.hashbits = hashbits;
            this.strSimHash = this.simHash();
        }

        private BigInteger simHash() {
            // 清洗文本，去除特殊字符
            tokens = cleanText(tokens);

            int[] v = new int[this.hashbits];

            // 使用 HanLP 进行分词
            List<Term> termList = HanLP.segment(tokens);

            // 过滤超频词
            int overCount = 5; // 设定超频词汇的界限
            Map<String, Integer> wordCount = new HashMap<>();

            for (Term term : termList) {
                String word = term.word.trim(); // 分词字符串

                // 过滤超频词
                if (wordCount.containsKey(word)) {
                    int count = wordCount.get(word);
                    if (count > overCount) {
                        continue;
                    }
                    wordCount.put(word, count + 1);
                } else {
                    wordCount.put(word, 1);
                }

                // 将每一个分词 hash 为一组固定长度的数列
                BigInteger t = this.hash(word);
                for (int i = 0; i < this.hashbits; i++) {
                    BigInteger bitmask = new BigInteger("1").shiftLeft(i);
                    if (t.and(bitmask).signum() != 0) {
                        v[i] += 1;
                    } else {
                        v[i] -= 1;
                    }
                }
            }

            BigInteger fingerprint = new BigInteger("0");
            for (int i = 0; i < this.hashbits; i++) {
                if (v[i] >= 0) {
                    fingerprint = fingerprint.add(new BigInteger("1").shiftLeft(i));
                }
            }
            return fingerprint;
        }

        private BigInteger hash(String source) {
            if (source == null || source.length() == 0) {
                return new BigInteger("0");
            }
            while (source.length() < 3) {
                source = source + source.charAt(0);
            }
            char[] sourceArray = source.toCharArray();
            BigInteger x = BigInteger.valueOf(((long) sourceArray[0]) << 7);
            BigInteger m = new BigInteger("1000003");
            BigInteger mask = new BigInteger("2").pow(this.hashbits).subtract(new BigInteger("1"));
            for (char item : sourceArray) {
                BigInteger temp = BigInteger.valueOf((long) item);
                x = x.multiply(m).xor(temp).and(mask);
            }
            x = x.xor(new BigInteger(String.valueOf(source.length())));
            if (x.equals(new BigInteger("-1"))) {
                x = new BigInteger("-2");
            }
            return x;
        }

        private int hammingDistance(MySimHash other) {
            BigInteger m = new BigInteger("1").shiftLeft(this.hashbits).subtract(new BigInteger("1"));
            BigInteger x = this.strSimHash.xor(other.strSimHash).and(m);
            int tot = 0;
            while (x.signum() != 0) {
                tot += 1;
                x = x.and(x.subtract(new BigInteger("1")));
            }
            return tot;
        }

        public double getSemblance(MySimHash other) {
            double i = (double) this.hammingDistance(other);
            return 1 - i / this.hashbits;
        }

    }


}

