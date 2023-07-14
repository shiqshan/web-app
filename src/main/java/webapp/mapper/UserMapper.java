package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import webapp.pojo.User;

import java.util.List;
import java.util.Map;

@Mapper
public interface UserMapper {

    int insertUser(User user);

    User getUserById(@Param("id") String id);

    int deleteUser(@Param("id") String id);

    int updateUser(User user);

    List<User> selectUserByPage(@Param("name") String name, @Param("phone") String phone, @Param("sex") String sex);

    User login(String username, String password);

    int register(@Param("username") String username, @Param("password") String password);

    //根据账号查用户
    User findUserByUsername(@Param("username") String username);

    //根据id获取当前登录用户信息
    Map<String, Object> getInfoById(@Param("id") String id);

    int update(User user);

    int setPassword(@Param("id") String id, @Param("newPassword") String newPassword);
}
