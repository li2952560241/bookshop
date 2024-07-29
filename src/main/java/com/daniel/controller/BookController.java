package com.daniel.controller;

import com.alibaba.fastjson.JSONObject;
import com.daniel.common.Result;
import com.daniel.common.ResultGenerator;
import com.daniel.pojo.Book;
import com.daniel.pojo.BookImage;
import com.daniel.pojo.Category;
import com.daniel.pojo.User;
import com.daniel.service.BookImageService;
import com.daniel.service.BookService;
import com.daniel.service.CategoryService;
import com.daniel.service.UserService;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Map;

// 这个类是对于书本的控制类
@RestController // 表示该类是一个控制器
@RequestMapping("/books") // 表示该类处理请求的路径
public class BookController {

    @Autowired
    private UserService userService;
    @Autowired
    private BookService bookService;
    @Autowired
    private BookImageService bookImageService;
    @Autowired
    private CategoryService categoryService;

    // 日志文件
    private static final Logger log = Logger.getLogger(BookController.class);

    /**
     * 书本详情页
     * @param id 图书ID
     * @return 该ID图书的详情页
     */
    @RequestMapping(value = "/{id}",method = RequestMethod.GET) // 表示处理请求的路径 对于不同的请求方式，使用不同的方法处理
    public ModelAndView getBookDetail(@PathVariable("id") String id) { // 表示处理请求的路径
        ModelAndView mav = new ModelAndView("bookDetail"); // 表示跳转的页面
        int intId = Integer.parseInt(id); // 将字符串转换为int类型
        Book curBook = bookService.get(intId); // 获取当前图书的信息
        curBook.setBookImage(bookImageService.getByBookId(intId)); // 获取当前图书的图片信息
        curBook.setUser(userService.get(bookService.getUserId(intId))); // 获取当前图书的作者信息
        mav.addObject("book",curBook); // 将当前图书的信息添加到mav中
        return mav; // 返回mav 返回参数的数据
    }

    /**
     * 上传图书
     * @param request 用于获取当前用户信息
     * @param book 图书实体类
     * @param file 图片文件
     */
    @RequestMapping(value = "", method = RequestMethod.POST)
    public Result uploadSell(HttpServletRequest request, Book book,
                             @RequestParam(value = "image", required = false) MultipartFile file) {
        User user = (User) request.getSession().getAttribute("user");

        if (user == null) {
            return ResultGenerator.genFailResult("用户未登录");
        }

        if (file == null || file.isEmpty()) {
            return ResultGenerator.genFailResult("图片文件不能为空");
        }

        if (book == null) {
            return ResultGenerator.genFailResult("图书信息不能为空");
        }

        try {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            long time = System.currentTimeMillis();
            String timeStr = sdf.format(time);

            book.setDate(timeStr);
            book.setUser(user);
            bookService.add(book);

            BookImage bookImage = new BookImage();
            bookImage.setBook(book);
            bookImageService.add(bookImage);

            String imageName = bookImage.getId() + ".jpg";
            String imagePath = request.getServletContext().getRealPath("/img/book-list/article/");
            File filePath = new File(imagePath, imageName);

            if (!filePath.getParentFile().exists()) {
                filePath.getParentFile().mkdirs();
            }

            file.transferTo(filePath);

            log.info("request: book/upload, book: " + book.toString());
            return ResultGenerator.genSuccessResult();
        } catch (IOException e) {
            log.error("上传失败", e);
            return ResultGenerator.genFailResult("上传失败: " + e.getMessage());
        }
    }

    /**
     * 编辑图书
     * 更新图书的视图
     * @param id 图书的ID
     * @return 该ID的图书的更新界面
     */
    @RequestMapping(value = "/renewal/{id}",method = RequestMethod.GET)
    public ModelAndView goEditBook(@PathVariable String id){
        ModelAndView  mav = new ModelAndView("editBook"); // 设置跳转的页面
        int bookId = Integer.parseInt(id); // 将字符串转换为int类型
        Book curBook = bookService.get(bookId);  // 获取当前图书的信息
        //log.info("request: book/update , book: " + curBook.toString()); // 记录日志
        if (curBook != null){ // 如果当前图书不为空
            curBook.setBookImage(bookImageService.getByBookId(bookId)); // 获取当前图书的图片信息,保存到curBook中
        }
        mav.addObject("book",curBook); // 将当前图书的信息添加到mav中
        Map<Integer,String> categories = categoryService.listByMap(); // 获取所有分类
        mav.addObject("categories",categories); // 将所有分类添加到mav中
        return mav;
    }

    /**
     * 根据ID获取书的Category
     * @param book
     * 应该使用GET的，但是会产生不合法URI异常，待解决
     */
    @RequestMapping(value = "/categories" ,method = RequestMethod.POST)
    public Result getCategory(@RequestBody Book book){
        JSONObject data = new JSONObject();
        Category category = bookService.get(book.getId()).getCategory();
        log.info("request: book/category/get , bookId: " + book.getId()+" , category:"+category.toString());
        if (category.getId() != 0){
            data.put("categoryId",category.getId());
            return ResultGenerator.genSuccessResult(data);
        }else {
            return ResultGenerator.genFailResult("无效的Category！");
        }
    }


    /**
     * 更新图书内容
     * @param request 用于获取路径
     * @param book 除图片外其他的图书信息
     * @param file 图片
     * @return
     * 应该使用PUT，可是需要上传图片，表单提交无法用PUT，待解决
     */
    @RequestMapping(value = "/renewal",method = RequestMethod.POST)
    public Result editBook(HttpServletRequest request, Book book,
                           @RequestParam(value = "image" , required = false) MultipartFile file){
        try {
            bookService.update(book);
            if (file != null) {
                BookImage bookImage = bookImageService.getByBookId(book.getId());
                bookImage.setBook(book);
                bookImageService.update(bookImage);
                String imageName = bookImage.getId() + ".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/book-list/article/");
                File filePath = new File(imagePath, imageName);
                if (!filePath.getParentFile().exists()) {
                    filePath.getParentFile().mkdir();
                }else if (filePath.exists()){
                    filePath.delete();
                }
                file.transferTo(new File(imagePath + File.separator + imageName));
            }
            log.info("request: book/update , book: " + book.toString());
            return ResultGenerator.genSuccessResult();
        } catch (IOException e) {
            e.printStackTrace();
            return ResultGenerator.genFailResult("修改失败！");
        }
    }



    /**
     * 删除一本或多本图书
     * @param request 用于获取路径，删除图片
     * @param bookIds 要删除的图书ID数组
     */
    @RequestMapping(value = "",method = RequestMethod.DELETE)
    public Result deleteBook(HttpServletRequest request, @RequestParam(value = "bookIds", required = false) String[] bookIds){

        if (bookIds != null) {
            // 遍历每个ID
            for (String bookId : bookIds) {
                int id = Integer.parseInt(bookId);

                // 获取当前图书的图片名称与存放路径
                String imageName = bookImageService.getByBookId(id).getId() + ".jpg";
                String imagePath = request.getServletContext().getRealPath("/img/book-list/article/");
                File filePath = new File(imagePath, imageName);

                // 删除图片
                if (filePath.exists()){
                    filePath.delete();
                }

                // 删除数据库中的图书
                bookImageService.deleteByBookId(id);
                bookService.delete(id);
            }
            log.info("request: book/delete , bookIds: " + Arrays.toString(bookIds));
            return ResultGenerator.genSuccessResult();
        }else {
            return ResultGenerator.genFailResult("删除失败！未选中图书");
        }
    }

}
