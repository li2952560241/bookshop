package com.daniel.service;

import com.daniel.pojo.User;

/*
UserService 接口，用于处理与 User 对象相关的业务逻辑。接口包含了几个方法，分别用于验证用户、获取用户信息等操作
 */
public interface UserService {

    boolean checkUser(User user);
    boolean checkUserTel(User user);
    int updateReset(User user);
    User get(int id);
    User getByStudentId(String studnetid);
    int addUser(User user); // 添加新用户的方法
    void updateUser(User user);
}
