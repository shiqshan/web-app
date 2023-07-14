package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import webapp.pojo.Order;

import java.util.List;

@Mapper
public interface OrderMapper {

    int submit(Order order);

    List<Order> selectOrderByPage();
}
