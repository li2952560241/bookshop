# 基于SSM的二手书交易系统

这是一个功能简单，使用Spring + Spring MVC + Mybatis搭建的二手书交易系统，我是基于[DanielLin07/bookshop: :book: 基于 SSM 框架的二手书交易系统 (github.com)](https://github.com/DanielLin07/bookshop)这个项目进行更改。原始项目比较久远了一些依赖过时了，我更新了相关依赖。

我的完善

1.原始项目没有写忘记密码的处理。

![img](assets/wps2.jpg)



我的处理建了一个forgetPassword 用来跳转到一个新的页面,在重置按钮中加了一个ajax进行操作,然后跳转到控制中的处理进行数据的更新。

2.注册页面缺少。我的处理通过添加一个页面和相关控制处理、数据库语句。完成操作。

3.搜索有问题没有结果显示，通过对searchBook.do进行修改，对前端的显示jsp也进行了修改，

4.在搜索页面中搜索页面显示个人名字有问题。把原始的前端显示修改成一个在对象中读取。

5.个人信息无法编辑

![img](assets/wps3.jpg) 

通过添加了控制处理+页面完成。但是显示有点不是很好看css不是很会用。

6.无法编辑图书  

![img](assets/wps4.jpg) 

原作者的jsp代码有一些问题。对ajax进部分修改



7.求书上传失败 

![img](assets/wps6.jpg) 

 修改了控制的处理



## 快速上手

### 1. 运行环境

  - IDE：IntelliJ IDEA
  - 项目构建工具：Maven
  - 数据库：MySQL
  - Tomcat：Tomcat 8.0.47

### 2. 初始化项目

  - 创建一个名为bookshop的数据库，将bookshop.sql导入
  - 打开IntelliJ IDEA，将项目导入
  - 修改jdbc.properties文件配置，同时配置Tomcat
  - 开始运行，访问http://localhost:8080/home.do

## 实现功能

  - 登录
  - 上传二手图书
  - 编辑二手图手
  - 图书分页展示

## 页面展示

<table>
    <tr>
        <td><img src="https://github.com/DanielLin07/bookshop/blob/master/Screenshots/login.jpg"/></td>
        <td><img src="https://github.com/DanielLin07/bookshop/blob/master/Screenshots/index.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://github.com/DanielLin07/bookshop/blob/master/Screenshots/home.jpg"/></td>
        <td><img src="https://github.com/DanielLin07/bookshop/blob/master/Screenshots/bookDetail.jpg"/></td>
    </tr>
    <tr>
        <td><img src="https://github.com/DanielLin07/bookshop/blob/master/Screenshots/myBookshelf.jpg"/></td>
        <td><img src="https://github.com/DanielLin07/bookshop/blob/master/Screenshots/upload.jpg"/></td>
    </tr>
</table>
