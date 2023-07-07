package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import webapp.pojo.Order;

@Mapper
public interface OrderMapper {
    int addOrder(String uId, String pId, String pay);
}
