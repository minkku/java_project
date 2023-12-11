package org.sara.mapper;

import org.sara.domain.UserVO;

import org.apache.ibatis.annotations.Param;

public interface UserMapper {
	public void reg(UserVO users) throws Exception;
	public UserVO login(UserVO uVo) throws Exception;
	public int loginck(@Param("email") String email, @Param("pw") String pw) throws Exception;
	UserVO getUserByEmail(String email) throws Exception;
	public void updateUser(UserVO uVo) throws Exception;
}
