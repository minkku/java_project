package org.sara.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.BookVO;

public interface BookService {
	public List<BookVO> getList();

	public List<BookVO> getBestList();

	public List<BookVO> getCommendList();

	List<BookVO> getAllBooks(int page, int pageSize);

	List<BookVO> getFicBooks(int page, int pageSize);

	List<BookVO> getCoBooks(int page, int pageSize);

	List<BookVO> getEduBooks(int page, int pageSize);
	
	List<BookVO> getYoungBooks(int page, int pageSize);

	List<BookVO> searchList(String searchType, String keyword,int page , int pageSize);

	 List<BookVO> getBooksByCategory(int category);
	public BookVO get(int books_id);
	
	public void insertItem(@Param("users_id") int users_id, @Param("books_id") int books_id, @Param("hiddenQuantity") int hiddenQuantity);

	int countBooks();

	int countEduBooks();
	
	int countYoungBooks();

	int countCoBooks();

	int countFicBooks();
	
	int countKey(String searchType,String keyword);
}
