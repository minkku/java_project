package org.sara.entity;

import org.sara.domain.UserVO;
import org.springframework.security.crypto.password.PasswordEncoder;

// ȸ�� ������ �����ϱ� ���� �����

public class UserEntity {
	private int user_id;
	private String email;
	private String pw;
	private String user_name;
	private String gender;
	private String mobile;
	
	public static UserVO createUser(UserVO userVO, PasswordEncoder passwordEncoder) {
		UserVO users = new UserVO();
		
		users.setEmail(userVO.getEmail());
		String pw = passwordEncoder.encode(userVO.getPw());
		users.setPw(userVO.getPw());
		users.setUser_name(userVO.getUser_name());
		users.setGender(userVO.getGender());
		users.setMobile(userVO.getMobile());
		
		return users;
	}
}
