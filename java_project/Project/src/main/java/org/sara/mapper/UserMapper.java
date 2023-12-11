package org.sara.mapper;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.UserVO;

public interface UserMapper {
	public void reg(UserVO users) throws Exception;
	public int emailCheck(String email) throws Exception;
	public UserVO getUserByEmail(UserVO mVO);
}
