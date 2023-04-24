package webapp.service;

import webapp.common.Result;
import webapp.pojo.User;

public interface UserService {

    Integer insertUser(User user);
    User getUserById(String userId);

    Integer deleteUser(String id);

    Integer updateUser(User user);
}
