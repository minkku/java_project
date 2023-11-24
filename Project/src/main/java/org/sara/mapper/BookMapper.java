package org.sara.mapper;

import java.util.List;

import org.sara.domain.BookVO;

public interface BookMapper {

	public List<BookVO> getList();
	public BookVO read(int books_id);
}
