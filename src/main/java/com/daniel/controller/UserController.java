package com.daniel.controller;

import com.daniel.common.Result;
import com.daniel.common.ResultGenerator;
import com.daniel.pojo.User;
import com.daniel.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.Map;

//用于处理与用户相关的操作。主要包括用户登录验证和登出操作
@RestController
@RequestMapping("/users")
public class UserController {

    @Autowired
    private UserService userService;

    // 日志文件
    private static final Logger log = Logger.getLogger(UserController.class);

    /*
        目的: 返回登录页面的视图。
        HTTP 请求: GET 请求到 /users。
        返回: 登录页面的视图 (login)。
    */

    @RequestMapping({"","**/users","**/login"})
    public ModelAndView login() {
        ModelAndView mvc = new ModelAndView();
        mvc.setViewName("login");
        return mvc;
    }

    /**
     * 验证登录
     * @param user 用户输入的学号与密码封装成的User对象
     * @param request 登录成功时将user存入session当中
     * @return 登录成功后跳转至首页
     *
     * 使用 userService.checkUser(user) 验证用户凭证。
     * 如果验证成功，将用户信息存入 session。
     * 返回一个成功的 Result 对象，并将当前用户信息放入数据中。
     * 如果验证失败，返回一个失败的 Result 对象。
     */
    @RequestMapping(value = "/sessions",method = RequestMethod.POST)
    @ResponseBody
    public Result checkLogin(@RequestBody User user, HttpServletRequest request) {
        // userService验证是否登录成功

        boolean flag = userService.checkUser(user); // 验证用户
        log.info("request: user/login , user: " + user.toString()); // 打印日志
        if (flag) {
            Map data = new HashMap();
            data.put("currentUser",user); // 将当前用户信息放入数据中
            // 登录成功，将登录信息放入session
            request.getSession().setAttribute("user",userService.getByStudentId(user.getStudentid()));
            return ResultGenerator.genSuccessResult(data); // 返回一个成功的 Result 对象
        }else {
            return ResultGenerator.genFailResult("学号或密码输入错误！"); // 返回一个失败的 Result 对象
        }
    }
    /**
    *忘记密码页面跳转
     */
    @RequestMapping(value = "/forgetPassword",method = RequestMethod.GET)
    public ModelAndView forgetPassword(HttpServletRequest request) {
        ModelAndView mvc = new ModelAndView();
        mvc.setViewName("forgetPassword");
        return mvc;
    }
    @PostMapping({"/resetPassword" })
    public Result resetPassword(@RequestBody User user) {
        try {
            boolean flag = userService.checkUserTel(user);
            if (flag) {
                userService.updateReset(user);
                return ResultGenerator.genFailResult("密码重置成功！");
            } else {
                return ResultGenerator.genFailResult("学号或手机号输入错误！");
            }
        } catch (Exception e) {
            e.printStackTrace();
            return ResultGenerator.genFailResult("服务器内部错误！");
        }
    }

    /**
     * 注册操作
     */
    @RequestMapping(value = "/enroll") //进行页面的跳转
    public ModelAndView enroll() {
        ModelAndView mvc = new ModelAndView();
        mvc.setViewName("enroll");
        return mvc;
    }
    /**
     * 进行注册的处理
     */
    @PostMapping("/enrollController")
    public Result enrollController(@RequestBody User user) {
        // 检查用户是否存在
        boolean flag = userService.checkUser(user); // 验证用户
        if (flag) {
            return ResultGenerator.genFailResult("该用户已存在！");
        } else {
            try {
                // 将新用户添加到数据库
                userService.addUser(user);
                return ResultGenerator.genFailResult("注册成功！");
            } catch (Exception e) {
                e.printStackTrace();
                return ResultGenerator.genFailResult("注册失败，服务器内部错误！");
            }
        }
    }

    /**
     * 登出操作
     * @param request 用于获取session中的User对象
     * @return 登出后跳转至登录界面
     *
     * 从 session 中移除用户信息。
     * 返回一个成功的 Result 对象
     */
    @RequestMapping(value = "/sessions",method = RequestMethod.DELETE)
    public Result logout(HttpServletRequest request) {
        request.getSession().removeAttribute("user");
        return ResultGenerator.genSuccessResult();
    }

    /**
     * 更新操作（对用户的信息进行编辑）
     *
     */
    // 显示编辑用户信息的页面
    @RequestMapping(value = "/update", method = RequestMethod.GET)
    public ModelAndView editUser(@RequestParam("id") int userId) {
        ModelAndView mav = new ModelAndView("editUser");
        User user = userService.get(userId); // 获取用户信息
        mav.addObject("user", user);
        return mav;
    }

    // 处理用户信息更新请求
    @RequestMapping(value = "/updateUser", method = RequestMethod.POST)
    public ModelAndView updateUser(@ModelAttribute User user, RedirectAttributes redirectAttributes) {
        try {
            userService.updateUser(user); // 更新用户信息
           ModelAndView mac = new ModelAndView();
           mac.setViewName("login");
           return mac;
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("errorMessage", "更新失败，请重试！");
            ModelAndView mac = new ModelAndView("redirect:/editUser");
            return mac;
        }
    }
}
