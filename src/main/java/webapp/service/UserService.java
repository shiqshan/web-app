package webapp.service;

import com.github.pagehelper.PageInfo;
import webapp.common.Result;
import webapp.pojo.User;

import java.util.HashMap;
import java.util.List;

public interface UserService {

    Integer insertUser(User user);

    User getUserById(String userId);

    Integer deleteUser(String id);

    Integer updateUser(User user);

    PageInfo<User> getUsers(Integer page, Integer size, String name, String phone, String sex);

    HashMap<String, String> findUserByNameAndPwd(String username, String password);

    //用户注册
    Result<?> register(String username, String password);

    //检查账号
    Result<?> isExist(String username);

    Result<?> getInfoById(String userId);

    Result<?> update(User user);

    Result setPassword(String id, String oldPassword, String newPassword);

}
