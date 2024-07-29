package com.daniel.controller;

import com.daniel.pojo.*;
import com.daniel.service.BookImageService;
import com.daniel.service.BookService;
import com.daniel.service.CategoryService;
import com.daniel.service.UserService;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

//用于处理与图书相关的前端请求
@Controller
public class ForeController {

    @Autowired
    private BookService bookService;
    @Autowired
    private CategoryService categoryService;

    /*
        处理 /home.do 请求。
        返回 home 视图。
        从 CategoryService 获取所有分类，并从 BookService 获取按分类组织的书籍。
        将分类和书籍数据添加到 ModelAndView 对象中。
     */
    @RequestMapping({"**/home.do"})
    public ModelAndView goHome() {
        ModelAndView mav =new ModelAndView("home");
        Map<Integer, String> categories = categoryService.listByMap();
        Map<Category,List<Book>> booksMap = bookService.listByCategory();
        mav.addObject("categories",categories);
        mav.addObject("booksMap",booksMap);
        return mav;
    }

    /*
        处理 /myBookshelf.do 请求。
        返回 myBookshelf 视图。
        从会话中获取当前用户，使用 bookService 获取该用户的书架中出售的二手书籍和求购的书籍。
     */
    @RequestMapping("/myBookshelf.do")
    public ModelAndView goMyBookshelf(HttpServletRequest request) {
        ModelAndView mav = new ModelAndView("myBookshelf");
        User user = (User) request.getSession().getAttribute("user");
        List<Book> books = bookService.listByUserId(user.getId(),1);
        List<Book> askBooks = bookService.listByUserId(user.getId(),0);
        mav.addObject("books",books);
        mav.addObject("askBooks",askBooks);
        return mav;
    }

    /*
        处理 /goUpload.do 请求。
        根据书籍类型决定视图路径（uploadSell 或 uploadAsk）。
        从 CategoryService 获取分类，并将其添加到 ModelAndView 对象中。
     */
    @RequestMapping("/goUpload.do")
    public ModelAndView upload(Book book){
        String path = book.getBookType()==1?"uploadSell":"uploadAsk";
        ModelAndView mav = new ModelAndView(path);
        Map<Integer,String> categories = categoryService.listByMap();
        mav.addObject("categories",categories);
        return mav;
    }
    /*
        处理 /goBookStore.do 请求。
        返回 bookStore 视图。
        根据请求参数和书籍分类，获取对应的书籍列表，并进行分页处理。
        将分类名称、书籍列表和分类数据添加到 ModelAndView 对象中。
     */

    @RequestMapping("/goBookStore.do")
    public ModelAndView goBookStore(Page page,Category category){
        ModelAndView mav = new ModelAndView("bookStore");
        Map<Integer, String> categories = categoryService.listByMap();
        Category curCategory = category.getId() !=0?categoryService.get(category.getId()):new Category();
        String categoryName = curCategory.getName() == null?"所有二手书":curCategory.getName();
        int total = bookService.count();
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        List<Book> books = curCategory.getId() == 0?bookService.listByBookType(1):bookService.listByCategoryId(1,curCategory.getId());
        mav.addObject("categoryName",categoryName);
        mav.addObject("books",books);
        mav.addObject("categories",categories);
        return mav;
    }

    /*
        处理 /goAskBookStore.do 请求。
        返回 askBookStore 视图。
        获取所有求购书籍的列表，并进行分页处理。
        将书籍列表添加到 ModelAndView 对象中。
     */
    @RequestMapping("/goAskBookStore.do")
    public ModelAndView goAskBookStore(Page page){
        ModelAndView mav = new ModelAndView("askBookStore");
        int total = bookService.count();
        page.calculateEnd(total);
        if (page.getStart() < 0) {
            page.setStart(0);
        }else if (page.getStart() > total){
            page.setEnd(page.getEnd());
        }
        PageHelper.offsetPage(page.getStart(),16);
        List<Book> books = bookService.listByBookType(0);
        mav.addObject("books",books);
        return mav;
    }

}
