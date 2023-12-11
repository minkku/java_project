package org.sara.mapper;

import org.sara.domain.UserVO;

public interface UserMapper {
	
	UserVO getUserByUsers_id(Integer users_id);
	
	public int delete(int users_id);
	
}
