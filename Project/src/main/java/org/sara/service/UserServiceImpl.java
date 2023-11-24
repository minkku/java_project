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
	public void signupUser(UserVO vo) throws Exception {
		try {
			if (vo == null) log.info("값이 안 들어왔어유");
		} catch (Exception e) {
			log.info("error" + e.getMessage());
		}
		mapper.registerUser(vo);
	}
	
}
