package webapp.service;

import webapp.pojo.User;

import java.util.List;

public interface UserService {

    Integer insertUser(User user);

    User getUserById(String userId);

    Integer deleteUser(String id);

    Integer updateUser(User user);

    List getUsers();
}
