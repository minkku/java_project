package org.sara.service;

import java.util.List;

import org.sara.domain.CartsVO;

public interface CartsService {
	public List<CartsVO> getCartsList(int users_id_id);
	
	public boolean deleteAllCartsList(int users_id_id);
	
	
//	public List<CartsVO> getList(); // 테스트용
}
