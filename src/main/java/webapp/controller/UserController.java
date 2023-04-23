package webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import webapp.pojo.User;
import webapp.service.impl.UserService;

import java.util.List;

@RestController
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

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


    @GetMapping("/getById")  // user/getById?id=622301199608167353
    public User getList(@RequestParam(value = "id") String id) {
        return userService.getUserById(id);
    }

    @GetMapping("/getById/{id}")  // user/getById/622301199608167353
    public User getList_pro(@PathVariable String id) {
        return userService.getUserById(id);
    }

    @PostMapping("/add")
    public int addUser() {
        return userService.insertUser();
    }
}
