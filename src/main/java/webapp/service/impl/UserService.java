package webapp.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import webapp.mapper.UserMapper;
import webapp.pojo.User;

@Service
public class UserService {

    @Autowired
    private UserMapper userMapper;

    public User getUserById(String userId) {
        User u = userMapper.getUserById(userId);
        if (null == u) {
            return null;
        }
        return userMapper.getUserById(userId);
    }

    public int insertUser() {
        return userMapper.insertUser();
    }
}

