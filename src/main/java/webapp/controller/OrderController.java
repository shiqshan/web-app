package webapp.controller;

import com.alibaba.fastjson2.JSONObject;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import webapp.common.Constants;
import webapp.common.RS;
import webapp.common.Result;
import webapp.pojo.Order;
import webapp.service.impl.OrderServiceImpl;

import java.util.List;

@RestController
@RequestMapping("/api/order")
public class OrderController {

    @Autowired
    private OrderServiceImpl orderService;

    /**
     * 购买下单
     *
     * @param order
     * @return
     */
    @PostMapping("/create")
    public Result<String> create(@RequestBody Order order) {
        return orderService.submit(order);
    }

    /**
     * 订单列表
     *
     * @param body
     * @return
     */
    @PostMapping("/list")
    public Result<?> getList(@RequestBody JSONObject body) {
        Integer page = body.getIntValue("page");
        Integer size = body.getIntValue("size");
        return orderService.getOrders(page, size);
    }

    /**
     * 订单详情
     * @param orderId
     * @return
     */
    @GetMapping("/detail")
    public Result<?> getDetail(@RequestParam(value = "orderId") String orderId) {
        return orderService.getDetail(orderId);
    }

    @PostMapping("/pay")
    public Result<?> doPay(@RequestBody Order order) {
        return orderService.doPay(order);
    }

    @PostMapping("/delete")
    public Result<?> delete(@RequestBody Order order) {
        return orderService.deleteOrderById(order);
    }

}
