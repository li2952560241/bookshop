package com.daniel.service.impl;

import com.daniel.dao.CategoryDAO;
import com.daniel.pojo.Category;
import com.daniel.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/*
CategoryServiceImpl 类通过实现 CategoryService 接口，提供了对分类信息的增删改查操作，以及将分类信息转换为 Map 的方法。
通过 @Service 注解和依赖注入，Spring 可以管理和调用该服务类中的方法，实现业务逻辑的处理
 */
@Service
public class CategoryServiceImpl implements CategoryService{

    @Autowired
    CategoryDAO categoryDAO;

    @Override
    public List<Category> list() {
        return categoryDAO.list();
    }

    @Override
    public Category get(int id) {
        return categoryDAO.get(id);
    }

    @Override
    public void update(Category category) {
        categoryDAO.update(category);
    }

    @Override
    public void delete(int id) {
        categoryDAO.delete(id);
    }

    @Override
    public int count() {
        return categoryDAO.count();
    }

    @Override
    public Map<Integer, String> listByMap() {
        List<Category> categories = categoryDAO.list();
        Map<Integer, String> categoriesMap = new HashMap<>();
        for (Category category : categories) {
            categoriesMap.put(category.getId(),category.getName());
        }
        return categoriesMap;
    }
}
