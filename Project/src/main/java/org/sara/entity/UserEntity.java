package org.sara.entity;

import org.sara.domain.UserVO;
import org.springframework.security.crypto.password.PasswordEncoder;

// 회원 정보를 저장하기 위한 저장소

public class UserEntity {
	private int user_id;
	private String email;
	private String pw;
	private String name;
	private String gender;
	private String mobile;
	
	public static UserVO createUser(UserVO userVO, PasswordEncoder passwordEncoder) {
		UserVO users = new UserVO();
		
		users.setEmail(userVO.getEmail());
		String pw = passwordEncoder.encode(userVO.getPw());
		users.setPw(userVO.getPw());
		users.setName(userVO.getName());
		users.setGender(userVO.getGender());
		users.setMobile(userVO.getMobile());
		
		return users;
	}
}
