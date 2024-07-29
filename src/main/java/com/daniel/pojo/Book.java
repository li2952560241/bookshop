package com.daniel.pojo;

/*
id：书籍的唯一标识符（整数类型）。
name：书籍的名称（字符串类型）。
category：书籍所属的类别（Category 类型）。
bookType：书籍的类型（整数类型）。
price：书籍的价格（双精度浮点数类型）。
originalPrice：书籍的原价（双精度浮点数类型）。
user：书籍的所有者或发布者（User 类型）。
author：书籍的作者（字符串类型）。
press：书籍的出版社（字符串类型）。
version：书籍的版本（字符串类型）。
degree：书籍的成色或质量（双精度浮点数类型）。
publishDate：书籍的出版日期（字符串类型）。
description：书籍的描述（字符串类型）。
date：书籍的记录日期或添加日期（字符串类型）。
bookImage：书籍的图片信息（BookImage 类型）。
 */
public class Book {

    private int id;
    private String name;
    private Category category;
    private int bookType;
    private double price;
    private double originalPrice;
    private User user;
    private String author;
    private String press;
    private String version;
    private double degree;
    private String publishDate;
    private String description;
    private String date;
    private BookImage bookImage;

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

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }

    public int getBookType() {
        return bookType;
    }

    public void setBookType(int bookType) {
        this.bookType = bookType;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public double getOriginalPrice() {
        return originalPrice;
    }

    public void setOriginalPrice(double originalPrice) {
        this.originalPrice = originalPrice;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPress() {
        return press;
    }

    public void setPress(String press) {
        this.press = press;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public double getDegree() {
        return degree;
    }

    public void setDegree(double degree) {
        this.degree = degree;
    }

    public String getPublishDate() {
        return publishDate;
    }

    public void setPublishDate(String publishDate) {
        this.publishDate = publishDate;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public BookImage getBookImage() {
        return bookImage;
    }

    public void setBookImage(BookImage bookImage) {
        this.bookImage = bookImage;
    }

    @Override
    public String toString() {
        return "id:" + this.id +
                " ,name:" + this.name +
                " ,category:" + this.category;
    }
}
