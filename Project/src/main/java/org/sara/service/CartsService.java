package org.sara.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListVO;

public interface CartsService {
	public List<CartsListVO> getCartsList(@Param("users_id") int users_id);
	
	public boolean deleteAllCartsList(@Param("users_id") int users_id);
	
	public boolean deleteCarts(@Param("users_id") int users_id, @Param("carts_id") List<Integer> carts_id);
	
	public boolean updateCarts(@Param("users_id") int users_id, @Param("carts_id") int carts_id,
							   @Param("books_id") int books_id, @Param("quantity") int quantity);
	public List<CartsListVO> getSelectCartsList(@Param("users_id") int users_id, @Param("carts_id") List<Integer> carts_id);
	
	public void insertItem(@Param("users_id") int users_id, @Param("books_id") int books_id, @Param("hiddenQuantity") int hiddenQuantity);

}
