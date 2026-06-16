package cn.kmbeast.controller;

import cn.kmbeast.pojo.api.ApiResult;
import cn.kmbeast.pojo.api.Result;
import cn.kmbeast.pojo.dto.query.extend.UserQueryDto;
import cn.kmbeast.pojo.entity.User;
import cn.kmbeast.service.UserService;
import cn.kmbeast.utils.JwtUtil;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/user")
public class UserController {

    @Resource
    private UserService userService;


    @PostMapping("/login")
    public Result<Map<String, Object>> login(@RequestBody Map<String, String> params) {
        // 添加调试日志
        System.out.println("=== 登录请求开始 ===");
        System.out.println("接收到的参数: " + params);
        System.out.println("username 参数值: " + params.get("username"));
        System.out.println("password 参数值: " + params.get("password"));
        System.out.println("参数键集合: " + params.keySet());

        String username = params.get("username");
        String password = params.get("password");
        if (username == null || password == null) {
            System.out.println("=== 错误：用户名或密码为空 ===");
            System.out.println("username is null: " + (username == null));
            System.out.println("password is null: " + (password == null));
            return ApiResult.error("用户名和密码不能为空");
        }

        // 按用户名查找用户
        User queryUser = new User();
        queryUser.setUsername(username); // 这里假设 User 实体有 username 字段
        User user = userService.getByActive(queryUser);
        if (user == null) {
            return ApiResult.error("用户名不存在");
        }
        if (!password.equals(user.getPassword())) {
            return ApiResult.error("密码错误");
        }
        if (user.getStatus() != null && user.getStatus() == 0) {
            return ApiResult.error("账号待审核，请联系管理员");
        }
        if (user.getStatus() != null && user.getStatus() == 2) {
            return ApiResult.error("账号已被禁用");
        }
        String token = JwtUtil.toToken(user.getId(), user.getRole());
        Map<String, Object> result = new HashMap<>();
        result.put("token", token);
        result.put("user", user);
        return ApiResult.success(result);
    }

    @PostMapping("/register")
    public Result<String> register(@RequestBody User user) {
        if (user.getPhone() == null || user.getPassword() == null) {
            return ApiResult.error("手机号和密码不能为空");
        }
        User queryUser = new User();
        queryUser.setPhone(user.getPhone());
        User exist = userService.getByActive(queryUser);
        if (exist != null) {
            return ApiResult.error("该手机号已注册");
        }
        if (user.getCreateTime() == null) {
            user.setCreateTime(LocalDateTime.now());
        }
        if (user.getStatus() == null) {
            user.setStatus(0);
        }
        if (user.getRole() == null) {
            user.setRole("student");
        }
        userService.insert(user);
        return ApiResult.success("注册成功，等待管理员审核");
    }

    @PostMapping
    public Result<String> add(@RequestBody User user) {
        if (user.getCreateTime() == null) {
            user.setCreateTime(LocalDateTime.now());
        }
        if (user.getStatus() == null) {
            user.setStatus(0);
        }
        userService.insert(user);
        return ApiResult.success();
    }

    @PutMapping
    public Result<String> update(@RequestBody User user) {
        userService.update(user);
        return ApiResult.success();
    }

    @DeleteMapping
    public Result<String> delete(@RequestBody List<Integer> ids) {
        userService.batchDelete(ids);
        return ApiResult.success();
    }

    @GetMapping("/{id}")
    public Result<User> getById(@PathVariable Integer id) {
        User user = userService.getById(id);
        if (user != null) {
            user.setPassword(null);
        }
        return ApiResult.success(user);
    }

    @PostMapping("/query")
    public Result<List<User>> query(@RequestBody UserQueryDto queryDto) {
        List<User> list = userService.query(queryDto);
        Integer total = userService.queryCount(queryDto);
        return ApiResult.success(list, total);
    }

    @GetMapping("/info/{id}")
    public Result<User> info(@PathVariable Integer id) {
        User user = userService.getById(id);
        if (user != null) {
            user.setPassword(null);
        }
        return ApiResult.success(user);
    }

    @PutMapping("/update-avatar")
    public Result<String> updateAvatar(@RequestBody Map<String, Object> params) {
        Integer id;
        Object idObj = params.get("id");
        if (idObj instanceof Integer) {
            id = (Integer) idObj;
        } else if (idObj instanceof String) {
            id = Integer.parseInt((String) idObj);
        } else {
            return ApiResult.error("参数类型错误");
        }
        String avatar = (String) params.get("avatar");
        if (id == null || avatar == null) {
            return ApiResult.error("参数不能为空");
        }
        userService.updateAvatar(id, avatar);
        return ApiResult.success();
    }

    @PutMapping("/update-password")
    public Result<String> updatePassword(@RequestBody Map<String, Object> params) {
        Integer id;
        Object idObj = params.get("id");
        if (idObj instanceof Integer) {
            id = (Integer) idObj;
        } else if (idObj instanceof String) {
            id = Integer.parseInt((String) idObj);
        } else {
            return ApiResult.error("参数类型错误");
        }
        String oldPwd = (String) params.get("oldPwd");
        String newPwd = (String) params.get("newPwd");
        String againPwd = (String) params.get("againPwd");

        if (id == null || oldPwd == null || newPwd == null || againPwd == null) {
            return ApiResult.error("所有字段不能为空");
        }
        if (oldPwd.trim().isEmpty() || newPwd.trim().isEmpty() || againPwd.trim().isEmpty()) {
            return ApiResult.error("密码不能为空白字符");
        }
        if (newPwd.length() < 6 || newPwd.length() > 20) {
            return ApiResult.error("新密码长度需在6-20位之间");
        }
        if (!newPwd.equals(againPwd)) {
            return ApiResult.error("两次密码输入不一致");
        }
        if (newPwd.equals(oldPwd)) {
            return ApiResult.error("新密码不能与原密码相同");
        }

        User user = userService.getById(id);
        if (user == null) {
            return ApiResult.error("用户不存在");
        }
        if (!oldPwd.equals(user.getPassword())) {
            return ApiResult.error("原密码错误");
        }

        userService.updatePassword(id, newPwd);
        return ApiResult.success("密码修改成功");
    }
}
