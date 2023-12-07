package org.sara.mapper;

import javax.servlet.http.HttpSession;

import org.sara.domain.UserVO;

public interface UserMapper {
	public void reg(UserVO users) throws Exception;
	public int emailCheck(String email) throws Exception;
	public UserVO getUserByEmail(UserVO mVO) throws Exception;
	public String loginCheck(String email, String pw) throws Exception;
}
