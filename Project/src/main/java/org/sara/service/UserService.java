package org.sara.service;

import org.sara.domain.UserVO;

public interface UserService {
	   UserVO getUserByUsers_id(Integer users_id);
       boolean authenticateUser(Integer users_id, String pw);
       public boolean remove(int board_id);
}
