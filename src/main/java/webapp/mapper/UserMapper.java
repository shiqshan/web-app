package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import webapp.pojo.User;

@Mapper
public interface UserMapper {
    int insertUser(@Param("id") String id,
                   @Param("name") String name,
                   @Param("address") String address,
                   @Param("sex") String sex,
                   @Param("id_sort") int id_sort,
                   @Param("qq") int qq,
                   @Param("tel_number") String tel_number,
                   @Param("account") String account,
                   @Param("password") String password
    );

    //查询用户 通过id
    User getUserById(@Param("id") String id);

    int insertUser();
}
