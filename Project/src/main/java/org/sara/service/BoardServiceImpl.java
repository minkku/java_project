package org.sara.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.sara.domain.BoardVO;
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

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	/*
	 * @Override public List<BoardVO> getList(Criteria cri ) {
	 * log.info("getList whit criteria" + cri); return
	 * mapper.getListWithPaging(cri); }
	 */

	@Override
	public List<BoardVO> getAllBoards(int page, int pageSize) {
		Map<String, Object> params = new HashMap<>();
		params.put("start", (page - 1) * pageSize);
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

		log.info("modify..." + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(int board_id) {
		log.info("remove..." + board_id);
		return mapper.delete(board_id) == 1;
	}

}
