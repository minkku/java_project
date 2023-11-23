package org.sara.service;

import org.sara.domain.UserVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@AllArgsConstructor
@Service
public class UserServiceImpl implement UserService {
	@Setter(onMethod_ = @Autowired)
	private UserVO vo;
	
	public void registerUser(UserVO vo) throws Exception {
		vo.registerUser;
	}
}
