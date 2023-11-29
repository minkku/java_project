package org.sara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListVO;

@Mapper
public interface CartsMapper{
	public List<CartsListVO> getCartsList(@Param("users_id") int users_id); // 장바구니 목록 봐야할때 장바구니 리스트를 불러옴
	
	public int deleteAllCartsList(@Param("users_id") int users_id); // 장바구니에서 구매하기로 들어갔을때 장바구니 초기화

	public int deleteCarts(@Param("users_id") int user_id, @Param("carts_id") Integer carts_id);
	
	public void updateCarts(@Param("users_id") int user_id,	@Param("carts_id") int carts_id,
							@Param("books_id") int books_id, @Param("quantity") int quantity);
	public CartsListVO getSelectCartsList(@Param("users_id") int users_id, @Param("carts_id") Integer carts_id);
}
