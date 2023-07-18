package webapp.pojo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.beans.Transient;

@Data  /* 生成getter,setter ,toString等函数*/
@NoArgsConstructor /*生成无参构造函数*/
@AllArgsConstructor /*生成有参构造函数*/
public class User {
    private String id;
    private String username;
    private String password;
    private String nickname;
    private int gold; //金币
    private String address;
    private String sex;
    private String tel_number;
    private String qq;
    private String createTime;
    private String avatar;
    private String age;
    private int id_sort;
    private int isDelete;
}
