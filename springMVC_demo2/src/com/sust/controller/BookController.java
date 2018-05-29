package com.sust.controller;

import com.sust.doamin.Book;
import com.sust.doamin.Category;
import com.sust.service.BookService;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class BookController {
    @Autowired
    private BookService bookService;

    private static final Log logger = LogFactory.getLog(BookController.class);

    /**
     * 查询全部图书
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/list-book")
    public String listBooks(Model model) {
        logger.info("图书列表 =========");
        List<Book> books = bookService.getAllBooks();
        model.addAttribute("books", books);
        return "BookList";
    }

    /**
     * 新增准备
     *
     * @param model
     * @return
     */
    @RequestMapping(value = "/input-book")
    public String inputBook(Model model) {
        logger.info("添加图书 ===========");
        List<Category> allCategories = bookService.getAllCategories();
        model.addAttribute("categories", allCategories);
        model.addAttribute("book", new Book());
        return "BookAddForm";
    }

    /**
     * 新增执行
     *
     * @param book
     * @return
     */
    @RequestMapping(value = "/save-book")
    public String saveBook(@ModelAttribute Book book) {
        Category category = bookService.getCategory(book.getCategory().getId());
        book.setCategory(category);
        bookService.save(book);
        return "redirect:/list-book";
    }

    /**
     * 修改准备
     *
     * @param model
     * @param id
     * @return
     */
    @RequestMapping(value = "/edit-book/{id}")
    public String editBook(Model model, @PathVariable long id) {
        List<Category> categories = bookService.getAllCategories();
        model.addAttribute("categories", categories);
        Book book = bookService.get(id);
        model.addAttribute("book", book);
        return "BookEditForm";
    }

    /**
     * 修改执行
     *
     * @param book
     * @return
     */
    @RequestMapping(value = "/update-book")
    public String updateBook(@ModelAttribute Book book) {
        Category category = bookService.getCategory(book.getCategory().getId());
        book.setCategory(category);
        bookService.update(book);
        return "redirect:/list-book";
    }

}
