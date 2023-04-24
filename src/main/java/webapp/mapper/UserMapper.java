package webapp.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import webapp.pojo.User;

@Mapper
public interface UserMapper {

    int insertUser(User user);

    User getUserById(@Param("id") String id);

    int deleteUser(@Param("id") String id);

    int updateUser(User user);
}
