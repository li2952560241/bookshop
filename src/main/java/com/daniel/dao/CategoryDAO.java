package com.daniel.dao;

import java.util.List;
import java.util.Map;

// 接口包含了对 Category 对象的增、删、改、查操作，以及获取所有类别和统计类别数量的方法。
import com.daniel.pojo.Category;

public interface CategoryDAO {

    void add(Category category);

    void delete(int id);

    Category get(int id);

    void update(Category category);

    // 获取所有Category
    List<Category> list();

    int count();

}
