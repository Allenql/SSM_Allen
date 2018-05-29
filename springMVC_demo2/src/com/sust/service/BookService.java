package com.sust.service;

import com.sust.doamin.Book;
import com.sust.doamin.Category;

import java.util.List;

public interface BookService {
    List<Category> getAllCategories();
    Category getCategory(int id);
    List<Book> getAllBooks();
    Book save(Book book);
    Book update(Book book);
    Book get(Long id);
    long getNextId();
}
