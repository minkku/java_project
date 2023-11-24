package org.sara.mapper;

import java.util.List;
import java.util.Map;

import org.sara.domain.BookVO;

public interface BookMapper {

	public List<BookVO> getList();
	public List<BookVO> getBestList();
	public List<BookVO> getCommendList();
	public BookVO read(int books_id);
	 List<BookVO> getAllBooks(Map<String, Object> params);
	    int countBooks();
}
