package org.sara.service;

import java.util.List;

import org.sara.domain.BoardVO;
import org.sara.domain.NoticeVO;

public interface BoardService {
	
	public List<BoardVO> getAllBoards(int page, int pageSize); 
	
	public int countBoards();
	
	public void register(BoardVO board);
		
	public BoardVO get(int board_id);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(int board_id);
	
	public String getUsersEmail(int users_id);
	
	public List<NoticeVO> getNoticeBoards(int page, int pageSize);
	
	public int countNoticeBoards();
	
	public List<BoardVO> myListBoards(int users_id, int page, int pageSize);
	
	public int countmyListBoards();
	
	public List<BoardVO> searchTypeTitle(String encodedKeyword ,int page, int pageSize);
	
	public int countTitle();
	
	public List<BoardVO> searchTypeContent(String encodedKeyword,int page, int pageSize);
	
	public int countContent();
}
