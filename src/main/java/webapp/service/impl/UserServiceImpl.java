package webapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import webapp.mapper.UserMapper;
import webapp.pojo.User;
import webapp.service.UserService;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;

    @Override
    public User getUserById(String userId) {
        User u = userMapper.getUserById(userId);
        return u;
    }

    @Override
    public Integer insertUser(User user) {
        User u = userMapper.getUserById(user.getId());
        if (u != null) {
            return 0;
        }
        return userMapper.insertUser(user);
    }

    @Override
    public Integer deleteUser(String id) {
        User u = userMapper.getUserById(id);
        if (u == null) {
            return 0;
        }
        return userMapper.deleteUser(id);
    }

    @Override
    public Integer updateUser(User user) {
        User u = userMapper.getUserById(user.getId());
        if (u == null) {
            return 0;
        }
        return userMapper.updateUser(user);
    }

    @Override
    public List getUsers() {
        return userMapper.getUsers();
    }
}

