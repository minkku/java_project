package org.sara.service;

import java.util.List;

import org.sara.domain.ReplyVO;

public interface ReplyService {

	public int register(ReplyVO vo); // 댓글등록

	public ReplyVO get(int reply_id); // 1건 댓글조회

	public int modify(ReplyVO vo); // 수정(pk값 제외 나머지값변경)

	public int remove(int reply_id); // 삭제

	List<ReplyVO> getListWithPaging(int books_id_id, int page, int pageSize);
// 특정게시글대한 전체댓글, ☆받아서 들어갈 테이블의 컬럼명쓰기

	int countReplies(int books_id_id);

}
