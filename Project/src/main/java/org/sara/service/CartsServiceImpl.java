package org.sara.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsVO;
import org.sara.mapper.CartsMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class CartsServiceImpl implements CartsService{
	@Setter(onMethod_ = @Autowired)
	private CartsMapper cartsMapper;

	@Override
	public List<CartsVO> getCartsList(@Param("users_id") int users_id) {
		log.info("cartsList-----------소환요 -> users_id_id값 =========>" + users_id);
		return cartsMapper.getCartsList(users_id);
	}

	@Override
	public boolean deleteAllCartsList(@Param("users_id") int users_id) {
		log.info("deleteAllCartsList------------소환요 -> users_id_id값 =========>" + users_id);
		return cartsMapper.deleteAllCartsList(users_id) == 1;
	}

	@Override
	public boolean deleteCarts(@Param("users_id") int users_id, List<Integer> carts_id) {
		try {
	        for (Integer id : carts_id) {
	            if (cartsMapper.deleteCarts(users_id, id) != 1) {
	                log.info("장바구니 선택삭제 실패함==============장바구니 선택삭제 실패함");
	                return false;
	            }
	        }
	        return true;
	    } catch (Exception e) {
	        log.error("에러요----------------------: " + e.getMessage());
	        return false;
	    }
	}
	
//	@Override // 테스트용
//	public List<CartsVO> getList() {
//		log.info("텟흐트");
//		return cartsMapper.getList();
//	}
}
