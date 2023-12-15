package org.sara.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.sara.domain.BoardVO;
import org.sara.domain.NoticeVO;
import org.sara.mapper.BoardMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter (onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public List<BoardVO> getAllBoards(int page, int pageSize ) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page -1) * pageSize);
		params.put("pageSize", pageSize);
		return mapper.getAllBoards(params);
	}
	
	@Override
	public int countBoards() {
		return mapper.countBoards();
	}
	
	
	@Override
	public void register(BoardVO board) {
		
		log.info("register_write" + board);
		mapper.insert(board);
	}

	@Override
	public BoardVO get(int board_id) {
		
		log.info("get..." + board_id);
		return mapper.read(board_id);
	}

	@Override
	public boolean modify(BoardVO board) {
		
		log.info("modify..."+board);
		return mapper.update(board)==1;
	}

	@Override
	public boolean remove(int board_id) {
		log.info("remove..." +board_id);
		return mapper.delete(board_id)==1;
	}

	@Override
	public String getUsersEmail(int users_id) {
		return mapper.getUsersEmail(users_id);
	}
	
	@Override	
	 public List<NoticeVO> getNoticeBoards(int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page -1) * pageSize);
		params.put("pageSize", pageSize);
		
		return mapper.getNoticeBoards(params);
	}

	@Override
	public int countNoticeBoards() {
		return mapper.countNoticeBoards();
	}
	
	@Override
	public List<BoardVO> myListBoards(int users_id, int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("start", (page -1) * pageSize);
		params.put("pageSize", pageSize);
		params.put("users_id", users_id)	;	
		log.info("mylist.." + users_id);
		log.info(params);
		return mapper.myListBoards(params);
	}
	
	@Override
	public int countmyListBoards() {
		return mapper.countmyListBoards();
	}

	@Override
	public List<BoardVO> searchTypeTitle(String encodedKeyword,int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();	
		
		params.put("start", (page -1) * pageSize);
		params.put("pageSize", pageSize);
		params.put("keyword", encodedKeyword)	;	
		log.info("searchTypeTitle" + encodedKeyword);
		log.info(params);
		
		return mapper.searchTypeTitle(params);
	}

	@Override
	public List<BoardVO> searchTypeContent(String encodedKeyword,int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		
		params.put("start", (page -1) * pageSize);
		params.put("pageSize", pageSize);
		params.put("keyword", encodedKeyword)	;	
		log.info("searchTypeContent" + encodedKeyword);
		log.info(params);
		
		return mapper.searchTypeContent(params);
	}

	@Override
	public int countTitle() {
		return mapper.countTitle();
	}

	@Override
	public int countContent() {
		return mapper.countContent();
	}

	@Override
	public NoticeVO getNoticeInfo(int notice_id) {
		return mapper.getNoticeInfo(notice_id);
	}

	
	
}