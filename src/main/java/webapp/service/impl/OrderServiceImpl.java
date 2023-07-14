package webapp.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import webapp.common.RS;
import webapp.common.Result;
import webapp.common.Utils;
import webapp.mapper.OrderMapper;
import webapp.pojo.Order;
import webapp.pojo.User;
import webapp.service.OrderService;

import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.List;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;


    @Override
    public Result submit(Order order) {
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        //获取Session中参数
        String id = (String) requestAttributes.getAttribute("u_id", RequestAttributes.SCOPE_SESSION);
        // 创建一个LocalDateTime对象
        LocalDateTime localDateTime = LocalDateTime.now();
        // 转换为毫秒数
        long milliseconds = localDateTime.toInstant(ZoneOffset.UTC).toEpochMilli();
        //订单ID
        long orderId = milliseconds + Long.parseLong(id);

        order.setOrderId(orderId);
        order.setUserId(Long.parseLong(id));
        int i = orderMapper.submit(order);
        if (i <= 0) {
            return RS.error("下单失败");
        }
        return RS.success("下单成功");
    }

    @Override
    public Result getOrders(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Order> orders = orderMapper.selectOrderByPage();
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return RS.success(Utils.simplePageInfo(pageInfo));
    }
}
