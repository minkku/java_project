package org.sara.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsVO;

public interface CartsService {
	public List<CartsVO> getCartsList(@Param("users_id") int users_id);
	
	public boolean deleteAllCartsList(@Param("users_id") int users_id);
	
	public boolean deleteCarts(@Param("users_id") int users_id, @Param("carts_id") List<Integer> carts_id);
//	public List<CartsVO> getList(); // 테스트용
}
