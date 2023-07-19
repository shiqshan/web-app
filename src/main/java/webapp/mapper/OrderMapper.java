package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import webapp.pojo.Order;

import java.math.BigDecimal;
import java.util.List;

@Mapper
public interface OrderMapper {

    int submit(Order order);

    List<Order> selectOrderByPage();

    Order getDetail(@Param("orderId") String orderId);

    int doPay(@Param("orderId") long orderId, BigDecimal amount);

//    int updateUserGold(@Param("userId") long userId, int newGold);
}
