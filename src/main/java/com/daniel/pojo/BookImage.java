package com.daniel.pojo;

/*
id：图像的唯一标识符（整数类型）。
book：图像对应的书籍（Book 类型）。
type：图像的类型（整数类型）。通常用来区分不同种类的图像，例如封面图、插图等
 */
public class BookImage {

    private int id;
    private Book book;
    private int type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Book getBook() {
        return book;
    }

    public void setBook(Book book) {
        this.book = book;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
