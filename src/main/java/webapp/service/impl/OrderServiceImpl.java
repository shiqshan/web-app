package webapp.service.impl;

import com.alibaba.fastjson2.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.ObjectUtils;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import webapp.common.RS;
import webapp.common.Result;
import webapp.common.Utils;
import webapp.mapper.OrderMapper;
import webapp.mapper.UserMapper;
import webapp.pojo.Order;
import webapp.pojo.User;
import webapp.service.OrderService;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.time.ZoneOffset;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class OrderServiceImpl implements OrderService {

    @Autowired
    private OrderMapper orderMapper;
    @Autowired
    private UserMapper userMapper;


    public String getSessionId() {
        RequestAttributes requestAttributes = RequestContextHolder.currentRequestAttributes();
        //获取Session中参数
        String id = (String) requestAttributes.getAttribute("u_id", RequestAttributes.SCOPE_SESSION);

        return id;
    }


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

        User user = userMapper.getUserById(id);
        if (null == user) {
            return RS.error("用户信息不存在，请重新登录");
        }

        //下单
        order.setOrderId(orderId);
        order.setUserId(Long.parseLong(id));
        int i = orderMapper.submit(order);
        if (i <= 0) {
            return RS.error("下单失败");
        }

        Map map = new HashMap();
        map.put("orderId", orderId);
        return RS.success(map);
    }

    @Override
    public Result getOrders(Integer page, Integer size) {
        PageHelper.startPage(page, size);
        List<Order> orders = orderMapper.selectOrderByPage();
        PageInfo<Order> pageInfo = new PageInfo<>(orders);
        return RS.success(Utils.simplePageInfo(pageInfo));
    }

    @Override
    public Result getDetail(String orderId) {
        String id = getSessionId();
        if (ObjectUtils.isEmpty(id)) {
            return RS.error("用户信息不存在，请重新登录");
        }

        Order o = orderMapper.getDetail(orderId);
        return RS.success(o);
    }

    @Override
    public Result doPay(Order order) {
        String id = getSessionId();
        if (ObjectUtils.isEmpty(id)) {
            return RS.error("用户信息不存在，请重新登录");
        }
        //查询余额
        User user = userMapper.getUserById(id);
        BigDecimal currentGold = new BigDecimal(user.getGold());
        int comparisonResult = currentGold.compareTo(order.getOrderAmount());
        //如果当前 BigDecimal 小于目标 BigDecimal，则返回负整数。
        if (comparisonResult < 0) {
            return RS.error("账户余额不足");
        }

        int i = orderMapper.doPay(order.getOrderId(), order.getOrderAmount());
        if (i <= 0) {
            return RS.error("支付失败");
        }
        return RS.success("支付成功");
    }


}
