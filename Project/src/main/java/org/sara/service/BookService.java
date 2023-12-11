package org.sara.service;

import java.util.List;

import org.sara.domain.BookVO;

public interface BookService {
	public List<BookVO> getList();

	public List<BookVO> getBestList();

	public List<BookVO> getCommendList();

	List<BookVO> getAllBooks(int page, int pageSize);

	List<BookVO> getFicBooks(int page, int pageSize);

	List<BookVO> getCoBooks(int page, int pageSize);

	List<BookVO> getEduBooks(int page, int pageSize);

	List<BookVO> getSearchList(String searchType, String keyword,int page ,int pageSize);

	public BookVO get(int books_id);

	int countBooks();

	int countEduBooks();

	int countCoBooks();

	int countFicBooks();
	
	int countkey(String searchType, String keyword);

}
