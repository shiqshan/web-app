package webapp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  /* 生成getter,setter ,toString等函数*/
@NoArgsConstructor /*生成无参构造函数*/
@AllArgsConstructor /*生成有参构造函数*/
public class Order {
    String id;
    String uId;
    String pId;
    String cteateTime;
    String pay;
}
