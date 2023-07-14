import org.junit.jupiter.api.Test;
import org.springframework.util.ObjectUtils;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.UUID;

public class TestDemo {

    @Test
    void testIsEmpty() {
//        System.out.println(ObjectUtils.isEmpty(new int[0]));
//        System.out.println(UUID.randomUUID().toString().replace("-", ""));
        DateTimeFormatter ofPattern = DateTimeFormatter.ofPattern("yyyyMMddHHmmssSSS");
        String localDate = LocalDateTime.now().format(ofPattern);
        localDate = localDate + 123;

        // 创建一个LocalDateTime对象
        LocalDateTime localDateTime = LocalDateTime.now();

// 转换为毫秒数
        long milliseconds = localDateTime.toInstant(ZoneOffset.UTC).toEpochMilli();
        System.out.println(milliseconds);
    }
}
