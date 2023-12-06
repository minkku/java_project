package org.sara.service;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.UserVO;

public interface UserService {
	public void reg(UserVO users) throws Exception;
	
	public int emailCheck(String email) throws Exception;
	
	public UserVO login(UserVO uVo) throws Exception;
}