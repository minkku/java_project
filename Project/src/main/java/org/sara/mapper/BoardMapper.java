package org.sara.mapper;

import java.util.List;
import java.util.Map;

import org.sara.domain.BoardVO;

public interface BoardMapper {

	public List<BoardVO> getList();

	public List<BoardVO> getAllBoards(Map<String, Object> params);

	public int countBoards();

	// public List<BoardVO> getListWithPaging(Criteria cri);

	public void insert(BoardVO board);

	// public void insertSelectKey(BoardVO board);

	public BoardVO read(int board_id);

	public int delete(int board_id);

	public int update(BoardVO board);
}
