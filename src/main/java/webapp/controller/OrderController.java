package webapp.controller;

import com.alibaba.fastjson2.JSONObject;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import webapp.common.RS;
import webapp.common.Result;
import webapp.pojo.Order;
import webapp.service.impl.OrderServiceImpl;

@RestController
@RequestMapping("/api/order")
public class OrderController {

    @Autowired
    private OrderServiceImpl heroOrderService;

    @PostMapping("/buy")
    public Result addOrder(@RequestBody JSONObject body, HttpSession session) {
        String pId = body.getString("pId");
        String pay = body.getString("pay");

        if (StringUtils.isEmpty(pId) || StringUtils.isEmpty(pay)) {
            return RS.errorResult(400, "参数错误");
        }
        String uId = (String) session.getAttribute("u_id");
        if (uId == null) {
            return RS.errorResult("未登录");
        }
        return heroOrderService.add(uId, pId, pay);
    }

}
