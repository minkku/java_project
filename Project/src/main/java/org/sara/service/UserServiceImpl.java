package org.sara.service;

import javax.servlet.http.HttpSession;

import org.sara.domain.UserVO;
import org.sara.mapper.UserMapper;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	private UserMapper mapper;

	 @Override
	 public void reg(UserVO user) throws Exception {
		 log.info("Registering user: " + user);
	    mapper.reg(user);
	 }
	 
	 @Override
	 public int emailCheck(String email) throws Exception {
		 return mapper.emailCheck(email);
	 }

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return mapper.getUserByEmail(vo);
	}

	@Override
	public String loginCheck(String email, String pw) throws Exception {
		return mapper.loginCheck(email,pw);
	}
}
