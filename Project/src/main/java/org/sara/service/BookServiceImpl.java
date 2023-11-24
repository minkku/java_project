package org.sara.service;

import java.util.List;

import org.sara.domain.BookVO;
import org.sara.mapper.BookMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService{
	
	private BookMapper mapper;
	@Override
	public List<BookVO> getList(){
		return mapper.getList();
		}
	@Override
	public BookVO get(int books_id) {
		return mapper.read(books_id);
		}
	

}
