package org.sara.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sara.domain.BookVO;
import org.sara.mapper.BookMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BookServiceImpl implements BookService {
	@Autowired
	private BookMapper mapper;

	@Override
	public List<BookVO> getList() {
		return mapper.getList();
	}

	@Override
	public BookVO get(int books_id) {
		return mapper.read(books_id);
	}

	@Override
	public List<BookVO> getAllBooks(int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page - 1) * pageSize);
		params.put("pageSize", pageSize);
		return mapper.getAllBooks(params);
	}

	@Override
	public List<BookVO> getEduBooks(int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page - 1) * pageSize);
		params.put("pageSize", pageSize);
		return mapper.getEduBooks(params);
	}

	@Override
	public List<BookVO> getFicBooks(int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page - 1) * pageSize);
		params.put("pageSize", pageSize);
		return mapper.getFicBooks(params);
	}

	@Override
	public List<BookVO> getCoBooks(int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page - 1) * pageSize);
		params.put("pageSize", pageSize);
		return mapper.getCoBooks(params);
	}
	@Override
	public List<BookVO> getSearchList(String searchType, String keyword,int page ,int pageSize){
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page - 1) * pageSize);
		params.put("searchType",searchType);
		params.put("keyword",keyword);
		params.put("pageSize",pageSize);
		
		return mapper.searchList(params);
	}

	@Override
	public int countBooks() {
		return mapper.countBooks();
	}

	@Override
	public int countEduBooks() {
		return mapper.countEduBooks();
	}

	@Override
	public int countCoBooks() {
		return mapper.countCoBooks();
	}

	@Override
	public int countFicBooks() {
		return mapper.countFicBooks();
	}
	
	
	public List<BookVO> getBestList() {
		return mapper.getBestList();
	}

	public List<BookVO> getCommendList() {
		return mapper.getCommendList();
	}

	@Override
	public int countkey(String searchType, String keyword) {
		// TODO Auto-generated method stub
		return mapper.countkey(searchType, keyword);
	}

}
