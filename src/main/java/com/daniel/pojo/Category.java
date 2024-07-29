package com.daniel.pojo;


/*
用于表示书籍的类别信息。这个类包含两个属性：类别的唯一标识符（id）和类别名称（name）
 */
public class Category {

    private int id = 0;
    private String name;
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    @Override
    public String toString() {
        return "Category [id=" + id + ", name=" + name + "]";
    }

}
