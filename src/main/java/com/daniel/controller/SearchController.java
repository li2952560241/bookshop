package com.daniel.controller;

import com.daniel.pojo.Book;
import com.daniel.service.BookService;
import org.apache.lucene.document.Document;
import org.apache.lucene.document.Field;
import org.apache.lucene.document.TextField;
import org.apache.lucene.index.*;
import org.apache.lucene.queryparser.classic.ParseException;
import org.apache.lucene.queryparser.classic.QueryParser;
import org.apache.lucene.search.IndexSearcher;
import org.apache.lucene.search.Query;
import org.apache.lucene.search.ScoreDoc;
import org.apache.lucene.store.Directory;
import org.apache.lucene.store.RAMDirectory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.wltea.analyzer.lucene.IKAnalyzer;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

//用于处理书籍搜索请求的 Spring MVC 控制器类
@Controller
public class SearchController {

    @Autowired
    private BookService bookService;

    /*
    处理 /searchBook.do 请求。
    根据用户提供的关键字（书籍名称）进行搜索。
    返回搜索结果的视图 (searchBook)，并将搜索到的书籍列表添加到模型中。
*/
    @RequestMapping(value = "searchBook.do", method = RequestMethod.POST)
    public ModelAndView searchBook(Book book) throws IOException, ParseException {
        ModelAndView mav = new ModelAndView("searchBook");

        // 关键字
        String keyword = book.getName();
        System.out.println("搜索关键字: " + keyword);

        // 准备中文分词器
        IKAnalyzer analyzer = new IKAnalyzer();
        // 索引
        Directory index = createIndex(analyzer);
        // 查询器
        Query query = new QueryParser("name", analyzer).parse(keyword);
        // 搜索
        IndexReader reader = DirectoryReader.open(index);
        IndexSearcher searcher = new IndexSearcher(reader);
        int numberPerPage = 10;
        ScoreDoc[] hits = searcher.search(query, numberPerPage).scoreDocs;
        List<Book> books = new ArrayList<>();
        for (int i = 0; i < hits.length; i++) {
            ScoreDoc scoreDoc = hits[i];
            int docId = scoreDoc.doc;
            Document document = searcher.doc(docId);
            Book tmpBook = bookService.get(Integer.parseInt(document.get("id")));
            books.add(tmpBook);
        }

        mav.addObject("books", books); //返回查找结果添加到模型中
        mav.addObject("keyword", keyword); // 将关键字添加到模型中
        return mav;
    }




    // 创建索引
    /*
        创建一个 RAMDirectory 用于存储索引数据。
        配置 IndexWriter 使用 IKAnalyzer。
        使用 IndexWriter 将所有书籍（从 bookService 获取）添加到索引中。
        关闭 IndexWriter 并返回索引对象。
     */
    private Directory createIndex(IKAnalyzer analyzer) throws IOException {
        Directory index = new RAMDirectory();
        IndexWriterConfig config = new IndexWriterConfig(analyzer);
        IndexWriter writer = new IndexWriter(index,config);
        List<Book> books = bookService.listByBookType(1);
        for (Book book : books) {
            addDoc(writer,book);
        }
        writer.close();
        return index;
    }

    //将一个 Book 对象添加到 Lucene 索引中。
    /*
    创建一个 Lucene Document。
    将书籍的 ID 和名称添加到文档中。
    使用 IndexWriter 将文档添加到索引中。
     */
    private void addDoc(IndexWriter writer,Book book) throws IOException {
        Document doc = new Document();
        doc.add(new TextField("id",book.getId()+"",Field.Store.YES));
        doc.add(new TextField("name",book.getName(),Field.Store.YES));
        writer.addDocument(doc);
    }

}
