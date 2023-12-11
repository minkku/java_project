package org.sara.service;

import org.sara.domain.UserVO;
import org.sara.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {
	private UserMapper mapper;

	// 유저가 회원가입시 비밀번호를 암호화 시켜주기 위한 설정
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;

	 @Override
	 public void reg(UserVO user) throws DuplicateKeyException, InvalidPasswordException, Exception {
			try {
			// 사용자가 입력한 원본 비밀번호를 Bcrypt로 해싱하여 저장
			if(!isValidPassword(user.getPw())) {
				throw new InvalidPasswordsException("Invalid password");
			}
			String hashedPassword = passwordEncoder.encode(user.getPw());
			user.setPw(hashedPassword);;
			
			log.info("Registering user: " + user);
			mapper.reg(user);
		} catch (DuplicateKeyException e) {
			throw new DuplicateKeyException("Email address already exists.", e);
		} catch (Exception e) {
			throw new RegistrationException("Error during user registration.", e);
		}
	 }
	
	 
	 @Override
	 public int emailCheck(String email) throws Exception {
		 return mapper.emailCheck(email);
	 }

	@Override
	public UserVO login(UserVO vo) throws Exception {
		return mapper.getUserByEmail(vo);
	}
}
