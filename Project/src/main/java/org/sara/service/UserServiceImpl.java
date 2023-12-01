package org.sara.service;

import java.util.Random;

import org.apache.ibatis.annotations.Param;
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

}
