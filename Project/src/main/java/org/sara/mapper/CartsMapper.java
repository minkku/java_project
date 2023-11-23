package org.sara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsVO;

@Mapper
public interface CartsMapper{
	public List<CartsVO> getCartsList(@Param("users_id") int users_id); // 장바구니 목록 봐야할때 장바구니 리스트를 불러옴
	
	
	public int deleteAllCartsList(@Param("users_id") int users_id); // 장바구니에서 구매하기로 들어갔을때 장바구니 초기화


//	*장바구니에서 선택된것들을 장바구니 목록에서 삭제
	public int deleteCarts(@Param("users_id") int user_id, @Param("carts_id") Integer carts_id);
//	=> 유저 id값을 인자로 받은 리스트 화면에서 인자로 받은 carts_id 값들을 삭제
//
//	*장바구니에서 선택된것들을 오더페이지로 이동
//	buyCarts(int user_id_id, int carts_id)
//	=> 유저 id값을 인자로 받은 리스트 화면에서 인자로 받은 carts_id 값들을 주문페이지로 이동
//
//	*장바구니에 선됙된것들의 총 가격
//	totalPrice(int user_id_id, int carts_id, int books_id_id, int quantity)
//	=> 유지 id값을 인자로 받은 리스트 화면에서 인자로 받은 carts_id값들을
//	books_id_id의 인자를 받아 price를 받아와 quantity(갯수) 만큼 값을 더해 가져온것들의 총 값을 구한다
	
//	public List<CartsVO> getList(); // 테스트용
}
