package com.daniel.dao;

import com.daniel.pojo.User;

// 接口包含了对 User 对象的查、改、校验密码和通过学生 ID 获取用户的方法
public interface UserDAO {

    User get(int id);

    void update(User user);

    int checkPassword(User user);

    int checkTel(User user);

    User getByStudentid(String studentid);

    int updateReset(User user);
    
    int addUser(User user); // 添加新用户的方法

    void updateUser(User user);

}
