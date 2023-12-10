package org.sara.service;

import javax.servlet.http.HttpSession;

import org.sara.domain.UserVO;

public interface UserService {
	public void reg(UserVO users) throws Exception;
	
	public UserVO login(UserVO uVo) throws Exception;
	
	public int loginck(String email, String pw) throws Exception;
	
	public void updateUser(UserVO updateUser) throws Exception;
}