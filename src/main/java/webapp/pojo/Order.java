package webapp.pojo;

import com.alibaba.fastjson2.JSONObject;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Data  /* 生成getter,setter ,toString等函数*/
@NoArgsConstructor /*生成无参构造函数*/
@AllArgsConstructor /*生成有参构造函数*/
public class Order {
    private long orderId;
    private long userId;
    private long productId;
    private String orderDate;
    private String paymentStatus;
    private BigDecimal orderAmount;
    private String recipientName;
    private String recipientPhone;
    private String shippingAddress;
    private String logisticsStatus;
    private String logisticsCompany;
    private String waybillNumber;
    private String orderStatus;
    private String remarks;
}
