package webapp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data  /* 生成getter,setter ,toString等函数*/
@NoArgsConstructor /*生成无参构造函数*/
@AllArgsConstructor /*生成有参构造函数*/
public class User {
    String id;
    String username;
    String password;
    String nickname;
    String address;
    String sex;
    String tel_number;
    String qq;
    String createTime;
    String avatar;
    String age;
    int id_sort;
    int isDelete;
}
