package webapp.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.DigestUtils;
import webapp.common.RS;
import webapp.common.Result;
import webapp.mapper.UserMapper;
import webapp.pojo.User;
import webapp.service.UserService;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
    public User login(String username, String password) {
        String pwd = DigestUtils.md5DigestAsHex(password.getBytes());
        return userMapper.login(username, pwd);
    }

    @Override
    public Result register(String username, String password) {
        //注册
        String md5 = DigestUtils.md5DigestAsHex(password.getBytes());
        int i;
        try {
            //username 是唯一key，不能重复，直接注册捕获异常
            i = userMapper.register(username, md5);
        } catch (Exception SQLIntegrityConstraintViolationException) {
            return RS.error(0, "该账号已注册");
        }
        if (i == 0) {
            return RS.error("注册失败");
        }
        return RS.success("注册成功");
    }

    @Override
    public Result isExist(String username) {
        User u = userMapper.findUserByUsername(username);
        // 1 存在  0不存在
        if (u != null) {
            return RS.success(1);
        }
        return RS.success(0);
    }

    @Override
    public Result getInfoById(String userId) {
        Map map = userMapper.getInfoById(userId);
        return RS.success(map);
    }

    @Override
    public Result update(User user) {
        int i = userMapper.update(user);
        if (i > 0) {
            return RS.success("修改成功");
        }
        return RS.error("修改失败");
    }

    @Override
    public Result setPassword(String id, String oldPassword, String newPassword) {
        //根据id 查旧密码是否正确
        String oldMd5 = DigestUtils.md5DigestAsHex(oldPassword.getBytes());
        User u = userMapper.getUserById(id);
        if (!oldMd5.equals(u.getPassword())) {
            return RS.error(0, "旧密码不正确");
        }

        String newMd5 = DigestUtils.md5DigestAsHex(newPassword.getBytes());
        int i = userMapper.setPassword(id, newMd5);
        if (i <= 0) {
            return RS.error(500, "密码修改失败");
        }
        return RS.success("密码修改成功");
    }
}

