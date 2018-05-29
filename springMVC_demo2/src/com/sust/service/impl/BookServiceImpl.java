package com.sust.service.impl;

import com.sust.doamin.Book;
import com.sust.doamin.Category;
import com.sust.service.BookService;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Service
public class BookServiceImpl implements BookService {
    private List<Category> categories;
    private List<Book> books;

    public BookServiceImpl() {
        categories = new ArrayList<Category>();
        Category category1 = new Category(1, "计算机");
        Category category2 = new Category(2, "旅行");
        Category category3 = new Category(3, "健康");
        categories.add(category1);
        categories.add(category2);
        categories.add(category3);

        books = new ArrayList<Book>();
        books.add(new Book(1L, "9781771970273", "Servlet & JSP ", category1, "Budi Kurniawan", new BigDecimal("54.99")));
        books.add(new Book(1L, "9781771970273", "Head First Java中文版 ", category1, "Jayden Ky", new BigDecimal("39.99")));
    }

    @Override
    public List<Category> getAllCategories() {
        return categories;
    }

    @Override
    public Category getCategory(int id) {
        for (Category category : categories) {
            if (id == category.getId()) {
                return category;
            }
        }
        return null;
    }

    @Override
    public List<Book> getAllBooks() {
        return books;
    }

    @Override
    public Book save(Book book) {
        book.setId(getNextId());
        books.add(book);
        return book;
    }

    @Override
    public Book update(Book book) {
        int bookCount = books.size();
        for (int i = 0; i < bookCount; i++) {
            Book savedBook = books.get(i);
            if (savedBook.getId() == book.getId()) {
                books.set(i, book);
                return book;
            }
        }
        return book;
    }

    @Override
    public Book get(Long id) {
        for (Book book : books) {
            if (id == book.getId()) {
                return book;
            }
        }
        return null;
    }

    @Override
    public long getNextId() {
        long id = 0L;
        for (Book book : books) {
            long bookId = book.getId();
            if (bookId > id) {
                id = bookId;
            }
        }
        return id + 1;
    }
}
