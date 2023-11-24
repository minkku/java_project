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
public class BookServiceImpl implements BookService{
	@Autowired
	private BookMapper mapper;
	@Override
	public List<BookVO> getList(){
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
    public int countBooks() {
        return mapper.countBooks();
    }
	public List<BookVO> getBestList() {
		return mapper.getBestList();
	}
	public List<BookVO> getCommendList() {
		return mapper.getCommendList();
	}

}
