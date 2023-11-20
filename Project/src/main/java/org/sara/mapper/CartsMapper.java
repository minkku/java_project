package org.sara.mapper;

import java.util.List;

import org.sara.domain.CartsVO;

public interface CartsMapper{
	public List<CartsVO> getCartList(int id);
	
//	public int getPrice(List<CartsVO> list);
}
