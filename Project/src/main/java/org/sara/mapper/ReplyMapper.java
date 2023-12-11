package org.sara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.ReplyVO;

public interface ReplyMapper {

	public int insert(ReplyVO vo);

	public ReplyVO read(int reviews_id);

	public int delete(int reviews_id);

	public int update(ReplyVO content);

	 List<ReplyVO> getListWithPaging(@Param("books_id") int books_id_id);
 //param(받아오는 인자이름)+ 데이터형 +테이블 컬럼명
	int countReplies(int books_id_id);

}
