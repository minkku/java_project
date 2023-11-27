package org.sara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListDTO;

@Mapper
public interface CartsMapper{
	public List<CartsListDTO> getCartsList(@Param("users_id") int users_id); // 장바구니 목록 봐야할때 장바구니 리스트를 불러옴
	
	
	public int deleteAllCartsList(@Param("users_id") int users_id); // 장바구니에서 구매하기로 들어갔을때 장바구니 초기화


//	*장바구니에서 선택된것들을 장바구니 목록에서 삭제
	public int deleteCarts(@Param("users_id") int user_id, @Param("carts_id") Integer carts_id);
//	=> 유저 id값을 인자로 받은 리스트 화면에서 인자로 받은 carts_id 값들을 삭제
	
	public void updateCarts(@Param("users_id") int user_id,	@Param("carts_id") int carts_id,
							@Param("books_id") int books_id, @Param("quantity") int quantity);
}
