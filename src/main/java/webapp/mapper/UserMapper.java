package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import webapp.pojo.User;

import java.util.List;

@Mapper
public interface UserMapper {

    int insertUser(User user);

    User getUserById(@Param("id") String id);

    int deleteUser(@Param("id") String id);

    int updateUser(User user);

    List getUsers();

    User findUserByNameAndPwd(String name, String password);
}
