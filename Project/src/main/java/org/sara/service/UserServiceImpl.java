package org.sara.service;

import org.sara.domain.UserVO;
import org.sara.mapper.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;
   
	@Override
    public UserVO getUserByUsers_id(Integer users_id) {
        return userMapper.getUserByUsers_id(users_id);
    }

    @Override
    public boolean authenticateUser(Integer users_id, String pw) {
        UserVO user = getUserByUsers_id(users_id);
        return user != null && user.getPw().equals(pw);
    }
    @Override
	public int remove(int users_id) {
		log.info("remove.." + reviews_id);
		return userMapper.delete(users_id);
	}
}
