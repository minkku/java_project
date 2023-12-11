package org.sara.service;

import java.util.List;

import org.sara.domain.BoardVO;

public interface BoardService {

	public List<BoardVO> getAllBoards(int page, int pageSize);

	public int countBoards();

	// public List<BoardVO> getList(Criteria cri);

	public void register(BoardVO board);

	public BoardVO get(int board_id);

	public boolean modify(BoardVO board);

	public boolean remove(int board_id);

}
