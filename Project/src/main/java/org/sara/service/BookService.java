package org.sara.service;

import java.util.List;
import java.util.Map;

import org.sara.domain.BookVO;

public interface BookService {
 public List<BookVO> getList();
 public List<BookVO> getBestList();
 public List<BookVO> getCommendList();
 public BookVO get(int books_id);
 int countBooks();
 List<BookVO> getAllBooks(int page, int pageSize);
}
