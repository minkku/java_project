package org.sara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.BookVO;

public interface BookMapper {
	public BookVO read(int books_id);

	public List<BookVO> getList();

	public List<BookVO> getBestList();

	public List<BookVO> getCommendList();
	
	List<BookVO> getsearchList(Map<String, Object> params);

	List<BookVO> getAllBooks(Map<String, Object> params);

	List<BookVO> getCoBooks(Map<String, Object> params);

	List<BookVO> getFicBooks(Map<String, Object> params);

	List<BookVO> getEduBooks(Map<String, Object> params);

	int countBooks();

	int countEduBooks();

	int countCoBooks();

	int countFicBooks();
	
	int countKey(@Param("searchType") String searchType,@Param("keyword") String keyword);
}
