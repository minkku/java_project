package org.sara.service;

import java.util.List;

import org.sara.domain.BookVO;

public interface BookService {
 public List<BookVO> getList();
 public BookVO get(int books_id);
}
