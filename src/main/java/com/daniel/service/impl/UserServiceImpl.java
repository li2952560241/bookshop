package com.daniel.service.impl;

import com.daniel.dao.UserDAO;
import com.daniel.pojo.User;
import com.daniel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
/*
UserServiceImpl 类通过实现 UserService 接口，提供了用户密码检查、根据用户 ID 获取用户、根据学号获取用户等功能。
通过 @Service 注解和依赖注入，Spring 可以管理和调用该服务类中的方法，实现用户相关的业务逻辑处理。
 */
@Service
public class UserServiceImpl implements UserService{

    @Autowired
    private UserDAO userDAO;

    @Override
    public boolean checkUser(User user) {
        int flag = userDAO.checkPassword(user);
        return flag==1;
    }

    @Override
    public boolean checkUserTel(User user) {
        int flag = userDAO.checkTel(user);
        return flag==1;
    }

     public int updateReset(User user)
     {
         return userDAO.updateReset(user);
     }

    @Override
    public User get(int id) {
        return userDAO.get(id);
    }

    @Override
    public User getByStudentId(String studnetid) {
        return userDAO.getByStudentid(studnetid);
    }
    @Override
    public int addUser(User user) {
        return userDAO.addUser(user); // 调用DAO层方法将用户添加到数据库
    }

    @Override
    public void updateUser(User user) {
        userDAO.updateUser(user);
    }
}
