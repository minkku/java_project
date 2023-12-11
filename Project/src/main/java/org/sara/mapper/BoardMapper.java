package org.sara.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.BoardVO;
import org.sara.domain.NoticeVO;
  	
 
public interface BoardMapper {
	
	
	
	public List<BoardVO> getList();
	
	public List<BoardVO> getAllBoards(Map<String, Object> params);
	
	public int countBoards();
	
	public void insert(BoardVO board);
	
	public BoardVO read(int board_id);
	
	public int delete(int board_id);
	
	public int update(BoardVO board);
	
	public String getUsersEmail(int users_id_id);
	
	public List<NoticeVO> getNoticeBoards(Map<String, Object> params);
	
	public int countNoticeBoards();
	
	public List<BoardVO> myListBoards(Map<String, Object> params);
	
	public int countmyListBoards();

	public List<BoardVO> searchTypeTitle(Map<String, Object> params);
	
	public int countTitle();
	
	public List<BoardVO> searchTypeContent(Map<String, Object> params);
	
	public int countContent();
	}
