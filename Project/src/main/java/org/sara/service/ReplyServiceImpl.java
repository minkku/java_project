package org.sara.service;

import java.util.List;

import org.sara.domain.ReplyVO;
import org.sara.mapper.ReplyMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
public class ReplyServiceImpl implements ReplyService {
	@Setter(onMethod_ = @Autowired)
	private ReplyMapper mapper;

	@Override
	public int register(ReplyVO vo) {
		log.info("register.." + vo);
		return mapper.insert(vo);
	}

	@Override
	public ReplyVO get(int reply_id) {
		log.info("get......" + reply_id);
		return mapper.read(reply_id);
	}

	@Override
	public int modify(ReplyVO vo) {
		log.info("modify.... " + vo);
		return mapper.update(vo);
	}

	@Override
	public int remove(int reply_id) {
		log.info("remove.." + reply_id);
		return mapper.delete(reply_id);
	}

	@Override // 페이징 처리  ☆받아서 들어갈 테이블의 컬럼명쓰기
	public List<ReplyVO> getListWithPaging(int books_id_id, int page, int pageSize) {
//	    int startRow = (page - 1) * pageSize;  // 음수 고려 x  에러발생
		List<ReplyVO> allReplies = mapper.getListWithPaging(books_id_id);
	    int start = (page - 1) * pageSize;
	    int end = Math.min(start + pageSize, allReplies.size());
	    return allReplies.subList(start, end);
	}


	@Override
	public int countReplies(int books_id_id) {
		return mapper.countReplies(books_id_id);
	}

}
