package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import webapp.pojo.User;

import java.util.List;

@Mapper
public interface UserMapper {

    int insertUser(User user);

    User getUserById(@Param("id") String id);

    int deleteUser(@Param("id") String id);

    int updateUser(User user);

    List<User> selectUserByPage(@Param("name") String name, @Param("phone") String phone, @Param("sex") String sex);

    User findUserByNameAndPwd(String name, String password);

    Integer getTotal();
}
