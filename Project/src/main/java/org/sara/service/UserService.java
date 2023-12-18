package org.sara.service;

import org.sara.domain.UserVO;

public interface UserService {
	public void reg(UserVO users) throws Exception;
	
	public UserVO login(UserVO uVo) throws Exception;
	
	public int loginck(String email, String pw) throws Exception;
	
	UserVO getUserByEmail(String email) throws Exception;
	
	public void updateUser(UserVO updateUser) throws Exception;
	
	UserVO selectUserInfo(String email) throws Exception;
}