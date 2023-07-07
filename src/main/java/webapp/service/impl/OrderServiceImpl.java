package webapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import webapp.common.RS;
import webapp.common.Result;
import webapp.mapper.OrderMapper;
import webapp.service.OrderService;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;

    public Result add(String uId, String pId, String pay) {
        int i = orderMapper.addOrder(uId, pId, pay);
        if (i > 0) {
            return RS.successResult();
        }
        return RS.errorResult("下单失败");
    }
}
