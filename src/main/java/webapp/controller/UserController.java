package webapp.controller;

import com.alibaba.fastjson2.JSONObject;
import com.github.pagehelper.PageInfo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.DigestUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import webapp.common.Constants;
import webapp.common.Result;
import webapp.common.RS;
import webapp.common.Utils;
import webapp.pojo.User;
import webapp.service.impl.UserServiceImpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @PostMapping("/check")
    public Result check(@RequestBody JSONObject body) {
        String username = body.getString("username");
        if (StringUtils.isEmpty(username)) {
            return RS.error(400, "参数错误");
        }
        return userService.check(username);
    }

    @PostMapping("/register")
    public Result register(@RequestBody JSONObject body) {
        String username = body.getString("username");
        String password = body.getString("password");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            return RS.error(Constants.RESULT_CODE_PARAM_ERROR, "参数错误");
        }
        return userService.register(username, password);
    }

    /**
     * 根据用户名和密码登录
     *
     * @param request
     * @param body:   username, password
     * @return
     */
    @PostMapping("/login")
    public Result<User> userLogin(HttpServletRequest request, @RequestBody JSONObject body) {
        String username = body.getString("username");
        String password = body.getString("password");
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            return RS.error(Constants.RESULT_CODE_PARAM_ERROR, "参数错误");
        }
        password = DigestUtils.md5DigestAsHex(password.getBytes());
        HashMap map = userService.findUserByNameAndPwd(username, password);
        if (map.isEmpty()) {
            return RS.error("用户名和密码错误");
        }
        //登录通过后
        HttpSession session = request.getSession();
        session.setAttribute("u_id", map.get("id"));
        return RS.success(map);
    }

    /**
     * 退出登录
     *
     * @param session
     * @return
     */
    @GetMapping("/logout")
    public Result logout(HttpSession session) {
        session.removeAttribute("u_id");
        return RS.success("已退出登录");
    }

    /**
     * 根据id查询用户
     *
     * @param id
     * @return
     */
    @GetMapping("/getUserById")  // user/getUser?id=622301199608167353
    public Result<User> getUser(@RequestParam(value = "id") String id) {
        User u = userService.getUserById(id);
        return RS.success(u);
    }

    @GetMapping("/getUserById/{id}")  // user/getById/622301199608167353
    public User getList_pro(@PathVariable String id) {
        return userService.getUserById(id);
    }

    /**
     * 新增一个用户
     *
     * @param user
     * @return
     */
    @PostMapping("/insertUser")
    public Result insertUser(@RequestBody User user) {
        System.out.println(user);
        if (StringUtils.isEmpty(user.getUsername()) || StringUtils.isEmpty(user.getId())) {
            return RS.error(Constants.RESULT_CODE_PARAM_ERROR, "参数错误");
        }
        int u = userService.insertUser(user);
        if (u > 0) {
            return RS.success(user);
        }
        return RS.error("用户已存在");
    }

    /**
     * 删除一个用户
     *
     * @param user
     * @return
     */
    @PostMapping("/deleteUser")
    public Result deleteUser(@RequestBody User user) {
        int u = userService.deleteUser(user.getId());
        if (u > 0) {
            return RS.success();
        }
        return RS.error("用户不存在");
    }

    /**
     * 更改用户信息
     *
     * @param user
     * @return
     */
    @PostMapping("/updateUser")
    public Result updateUser(@RequestBody User user) {
        if (StringUtils.isEmpty(user.getId())) {
            return RS.error(Constants.RESULT_CODE_PARAM_ERROR, "参数错误");
        }
        int u = userService.updateUser(user);
        if (u > 0) {
            return RS.success();
        }
        return RS.error("更新失败");
    }

    /**
     * 查询所有用户
     *
     * @return
     */
    @PostMapping("/getUserList")
    public Result<List<User>> getUsers(@RequestBody JSONObject body) {
        Integer page = body.getIntValue("page");
        Integer size = body.getIntValue("size");
        String name = body.getString("name");
        String phone = body.getString("tel_number");
        String sex = body.getString("sex");
        PageInfo pageInfo = userService.getUsers(page, size, name, phone, sex);
        return RS.success(Utils.simplePageInfo(pageInfo));
    }
}
