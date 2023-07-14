package webapp.controller;

import com.alibaba.fastjson2.JSONObject;
import com.github.pagehelper.PageInfo;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.ObjectUtils;
import org.springframework.web.bind.annotation.*;
import webapp.common.Constants;
import webapp.common.Result;
import webapp.common.RS;
import webapp.common.Utils;
import webapp.pojo.User;
import webapp.service.impl.UserServiceImpl;

import java.util.Map;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @PostMapping("/is_exist")
    public Result check(@RequestBody JSONObject body) {
        String username = body.getString("username");
        if (ObjectUtils.isEmpty(username)) {
            return RS.error(400, "参数错误");
        }
        return userService.isExist(username);
    }

    @PostMapping("/register")
    public Result register(@RequestBody JSONObject body) {
        String username = body.getString("username");
        String password = body.getString("password");
        if (ObjectUtils.isEmpty(username) || ObjectUtils.isEmpty(password)) {
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
    public Result<?> userLogin(HttpServletRequest request, @RequestBody JSONObject body) {
        String username = body.getString("username");
        String password = body.getString("password");
        if (ObjectUtils.isEmpty(username) || ObjectUtils.isEmpty(password)) {
            return RS.error(Constants.RESULT_CODE_PARAM_ERROR, "参数错误");
        }
        Map map = userService.findUserByNameAndPwd(username, password);
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
    public Result<String> logout(HttpSession session) {
        session.removeAttribute("u_id");
        return RS.success("已退出登录");
    }

    /**
     * 获取当前登录用户的信息
     *
     * @param session
     * @return
     */
    @GetMapping("/info")
    public Result<?> getInfo(HttpSession session) {
        String id = (String) session.getAttribute("u_id");
        if (id == null) {
            return RS.success("用户信息不存在，请重新登录");
        }
        return userService.getInfoById(id);
    }

    /**
     * 修改基本信息
     *
     * @param session
     * @param user
     * @return
     */
    @PostMapping("/update_baseinfo")
    public Result<?> updateBaseInfo(HttpSession session, @RequestBody User user) {
        String id = (String) session.getAttribute("u_id");
        if (id == null) {
            return RS.error("用户信息不存在，请重新登录");
        }
        user.setId(id);
        return userService.update(user);
    }

    @PostMapping("/set_password")
    public Result<?> setPassword(HttpSession session, @RequestBody JSONObject body) {
        String id = (String) session.getAttribute("u_id");
        if (id == null) {
            return RS.error("用户信息不存在，请重新登录");
        }

        String oldPassword = body.getString("oldPassword");
        String newPassword = body.getString("newPassword");
        if (ObjectUtils.isEmpty(oldPassword) || ObjectUtils.isEmpty(newPassword)) {
            return RS.error("用户信息不存在，请重新登录");
        }
        return userService.setPassword(id, oldPassword, newPassword);
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
    public Result<?> insertUser(@RequestBody User user) {
        System.out.println(user);
        if (ObjectUtils.isEmpty(user.getUsername()) || ObjectUtils.isEmpty(user.getId())) {
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
    public Result<?> deleteUser(@RequestBody User user) {
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
    public Result<?> updateUser(@RequestBody User user) {
        if (ObjectUtils.isEmpty(user.getId())) {
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
    public Result getUsers(@RequestBody JSONObject body) {
        Integer page = body.getIntValue("page");
        Integer size = body.getIntValue("size");
        String name = body.getString("name");
        String phone = body.getString("tel_number");
        String sex = body.getString("sex");
        PageInfo<User> pageInfo = userService.getUsers(page, size, name, phone, sex);
        return RS.success(Utils.simplePageInfo(pageInfo));
    }

    @GetMapping("checkSession")
    public Result<?> checkSession(HttpSession session) {
        if (session.getAttribute("u_id") == null) {
            return RS.error("未登录");
        }
        return RS.success(1);
    }
}
