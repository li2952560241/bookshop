package com.daniel.service.impl;

import com.daniel.dao.BookImageDAO;
import com.daniel.pojo.Book;
import com.daniel.pojo.BookImage;
import com.daniel.service.BookImageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/*
实现了 BookImageService 接口，并定义了 BookImageServiceImpl 类用于处理与 BookImage 对象相关的业务逻辑
 */
@Service
public class BookImageServiceImpl implements BookImageService{

    @Autowired
    private BookImageDAO bookImageDAO;

    @Override
    public BookImage getByBookId(int bid) {
        return bookImageDAO.getByBookId(bid);
    }

    @Override
    public void add(BookImage bookImage) {
        bookImageDAO.add(bookImage);
    }

    @Override
    public void update(BookImage bookImage) {
        bookImageDAO.update(bookImage);
    }

    @Override
    public void deleteByBookId(int bid) {
        bookImageDAO.deleteByBookId(bid);
    }
}
