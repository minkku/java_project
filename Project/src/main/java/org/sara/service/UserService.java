package org.sara.service;

import javax.servlet.http.HttpSession;

import org.sara.domain.UserVO;

public interface UserService {
	public void reg(UserVO users) throws Exception;
	
	public int emailCheck(String email) throws Exception;
	
	public UserVO login(UserVO uVo) throws Exception;
	
	public String loginCheck(String email, String pw) throws Exception;
}