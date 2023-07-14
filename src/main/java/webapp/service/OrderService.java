package webapp.service;

import com.github.pagehelper.PageInfo;
import webapp.common.Result;
import webapp.pojo.Order;

import java.util.List;

public interface OrderService {
    Result submit(Order order);

    Result<PageInfo<Order>> getOrders(Integer page, Integer size);
}
