package com.daniel.pojo;
/*
用于表示用户的信息
id：用户的唯一标识符（整数类型）。
studentid：学生的学号（字符串类型）。
name：用户的姓名（字符串类型）。
password：用户的密码（字符串类型）。
sex：用户的性别（字符类型）。
tel：用户的电话号码（字符串类型）。
address：用户的地址（字符串类型）。
major：用户的专业（字符串类型）
 */

public class User {

    private int id;
    private String studentid;
    private String name;
    private String password;
    private char sex;
    private String tel;
    private String address;
    private String major;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getStudentid() {
        return studentid;
    }

    public void setStudentid(String studentid) {
        this.studentid = studentid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public char getSex() {
        return sex;
    }

    public void setSex(char sex) {
        this.sex = sex;
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getMajor() {
        return major;
    }

    public void setMajor(String major) {
        this.major = major;
    }

    @Override
    public String toString() {
        return "studentid:"+this.studentid+" ,name:"+this.name;
    }
}
