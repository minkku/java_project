package org.sara.service;
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
	public UserVO login(UserVO uVo) throws Exception {
		
		return mapper.login(uVo);
	}

	@Override
	public int loginck(String email, String pw) throws Exception {
		return mapper.loginck(email, pw);
	}

	@Override
	public UserVO getUserByEmail(String email) throws Exception {
		return mapper.getUserByEmail(email);
	}

	@Override
	public void updateUser(UserVO updateUser) throws Exception {
		mapper.updateUser(updateUser);
	}

	
}
