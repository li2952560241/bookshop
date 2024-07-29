package com.daniel.service;

import java.util.List;
import java.util.Map;

import com.daniel.pojo.Category;

/*
CategoryService 接口，用于处理与 Category 对象相关的业务逻辑。接口包含了多个方法，分别用于列出类别、获取类别、更新类别、删除类别和统计类别数量等操作
 */
public interface CategoryService {

    List<Category> list();
    Category get(int id);
    void update(Category category);
    void delete(int id);
    int count();

    //获取一个Key为CategoryId，Value为CategoryName的Map
    Map<Integer,String> listByMap();

}
