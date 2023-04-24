package webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import webapp.common.Result;
import webapp.common.ResultGenerator;
import webapp.pojo.User;
import webapp.service.impl.UserServiceImpl;

@RestController
@RequestMapping("/api/user")
public class UserController {

    @Autowired
    private UserServiceImpl userService;

    @GetMapping("/info")
    public String getUserInfo() {
        User u = new User();
        u.setName("李云龙");
        u.setAddress("独立团");
        u.setSex("男");
        u.setAge(40);
        u.setId_sort(1);
        return u.toString();
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
        if (null == u) {
            return ResultGenerator.nullResult("无数据");
        }
        return ResultGenerator.successResult(u);
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
    public Result<Number> insertUser(@RequestBody User user) {
        System.out.println(user);
        if (StringUtils.isEmpty(user.getName()) || StringUtils.isEmpty(user.getId())) {
            return ResultGenerator.errorResult(0, "缺少参数");
        }
        int u = userService.insertUser(user);
        if (u > 0) {
            return ResultGenerator.successResult(1);
        }
        return ResultGenerator.errorResult(0, "User already exists");
    }

    /**
     * 删除一个用户
     *
     * @param user
     * @return
     */
    @PostMapping("/deleteUser")
    public Result<Number> deleteUser(@RequestBody User user) {
        int u = userService.deleteUser(user.getId());
        if (u > 0) {
            return ResultGenerator.successResult(1);
        }
        return ResultGenerator.errorResult(0, "User does not exists");
    }

    /**
     * 更改用户信息
     *
     * @param user
     * @return
     */
    @PostMapping("/updateUser")
    public Result<Number> updateUser(@RequestBody User user) {
        if (user.getId() == null) {
            return ResultGenerator.errorResult(0, "id in bodyParam does not exist");
        }
        int u = userService.updateUser(user);
        if (u > 0) {
            return ResultGenerator.successResult(1);
        }
        return ResultGenerator.errorResult(0, "update failed");
    }
}
