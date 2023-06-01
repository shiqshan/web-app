package webapp.service;

import com.github.pagehelper.PageInfo;
import webapp.pojo.User;

import java.util.List;

public interface UserService {

    Integer insertUser(User user);

    User getUserById(String userId);

    Integer deleteUser(String id);

    Integer updateUser(User user);

    PageInfo<User> getUsers(Integer page, Integer size, String name, String phone, String sex);

    User findUserByNameAndPwd(String username, String password);

    //获取用户总数
    Integer getTotal();
}
