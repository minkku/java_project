package org.sara.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListVO;
import org.sara.domain.UsersVO;

public interface OrdersService {
	public List<CartsListVO> getCartsList(@Param("users_id") int users_id);
	
	public UsersVO getUsersInfo(@Param("users_id") int users_id);
}
