package webapp.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import webapp.common.RS;
import webapp.common.Result;
import webapp.mapper.UserMapper;
import webapp.pojo.User;
import webapp.service.UserService;

import java.text.SimpleDateFormat;
import java.util.Date;
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
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = sdf.format(new Date());
        user.setCreateTime(time);
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
    public PageInfo<User> getUsers(Integer page, Integer size, String name, String phone, String sex) {
        PageHelper.startPage(page, size);
        List<User> users = userMapper.selectUserByPage(name, phone, sex);
        PageInfo<User> pageInfo = new PageInfo<>(users);
        return pageInfo;
    }

    @Override
    public User findUserByNameAndPwd(String username, String password) {
        return userMapper.findUserByNameAndPwd(username, password);
    }

    @Override
    public Result register(String username, String password) {
        //查询账号是否存在
        User u = userMapper.findUserByUsername(username);
        if (u != null) {
            return RS.errorResult(0, "该账号已注册");
        }
        //注册
        int i = userMapper.register(username, password);
        if (i > 0) {
            return RS.successResult();
        }
        return RS.errorResult("注册失败");
    }

    @Override
    public Result check(String username) {
        User u = userMapper.findUserByUsername(username);
        // 1 不存在，可以注册  0已存在，不能注册
        if (u != null) {
            return RS.successResult(0);
        }
        return RS.successResult(1);
    }

    @Override
    public Integer getTotal() {
        return userMapper.getTotal();
    }
}

