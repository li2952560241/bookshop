package com.daniel.service;

import com.daniel.pojo.Book;
import com.daniel.pojo.BookImage;

/*
BookImageService 接口，用于处理与 BookImage 相关的业务逻辑。接口包含了四个方法，
分别用于根据书籍ID获取图片、添加图片、更新图片和根据书籍ID删除图片
 */
public interface BookImageService {

    BookImage getByBookId(int bid);
    void add(BookImage bookImage);
    void update(BookImage bookImage);
    void deleteByBookId(int bid);
}
