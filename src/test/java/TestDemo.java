import org.junit.jupiter.api.Test;
import org.springframework.util.ObjectUtils;

public class TestDemo {

    @Test
    void testIsEmpty() {
        System.out.println(ObjectUtils.isEmpty(new int[0]));
    }
}
