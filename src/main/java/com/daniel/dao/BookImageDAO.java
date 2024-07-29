package com.daniel.dao;

import com.daniel.pojo.BookImage;

//BookImageDAO 的接口，用于操作与书籍图像相关的数据
public interface BookImageDAO {

    /*BookImage getByBookId(@Param("start") int start, @Param("count") int count, @Param("cid") int cid);*/
    BookImage getByBookId(int bid);
    void add(BookImage bookImage);
    void update(BookImage bookImage);
    void deleteByBookId(int bid);
}
