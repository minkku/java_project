package org.sara.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListVO;
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
	public List<CartsListVO> getCartsList(@Param("users_id") int users_id) {
		log.info("cartsList-----------소환요 -> users_id_id값 ---------->" + users_id);
		return cartsMapper.getCartsList(users_id);
	}

	@Override
	public boolean deleteAllCartsList(@Param("users_id") int users_id) {
		log.info("deleteAllCartsList------------소환요 -> users_id_id값 ---------->" + users_id);
		return cartsMapper.deleteAllCartsList(users_id) == 1;
	}

	@Override
	public boolean deleteCarts(@Param("users_id") int users_id, @Param("carts_id") List<Integer> carts_id) {
		try {
	        for (Integer id : carts_id) {
	            if (cartsMapper.deleteCarts(users_id, id) != 1) {
	            	log.info("장바구니 선택삭제 실패함--------------------------");
	                return false;
	            }
	        }
	        return true;
	    } catch (Exception e) {
	    	log.info("delete false ------------------------------");
	        log.error("service error-------------------------> " + e.getMessage());
	        return false;
	    }
	}

	@Override
	public boolean updateCarts(@Param("users_id") int users_id, @Param("carts_id") int carts_id,
							   @Param("books_id") int books_id, @Param("quantity") int quantity) {
		log.info("service updateQuantity------------------------users_id---------> " + users_id);
		log.info("service updateQuantity --------------- carts_id -------------->" + carts_id);
		log.info("service updateQuantity --------------- books_id -------------->" + books_id);
		log.info("service updateQuantity --------------- quantity -------------->" + quantity);
		try {
	            if (carts_id < 0) {
	            	log.info("장바구니 선택삭제 실패함--------------------------");
	                return false;
	            } else {
	            	log.info("updateCarts-----carts_id값----------" + carts_id);
	            }
			cartsMapper.updateCarts(users_id, carts_id, books_id, quantity);
			return true;
		} catch (Exception e) {
			log.info("update false----------------------------------");
			log.error("service error--------------------------------" + e.getMessage());
			return false;
		}
	}

	@Override
	public List<CartsListVO> getSelectCartsList(@Param("users_id") int users_id, @Param("carts_id") List<Integer> carts_id) {
		List<CartsListVO> cvo = new ArrayList<CartsListVO>();
		try {
			for (Integer id : carts_id) {
				cvo.add(cartsMapper.getSelectCartsList(users_id, id));
			}
		} catch (Exception e) {
			log.error("service error------------------------" + e.getMessage());
		}
		return cvo;
	}
	
	@Override
	public void insertItem(@Param("users_id") int users_id, @Param("books_id") int books_id, @Param("hiddenQuantity") int hiddenQuantity) {
		cartsMapper.insertItem(users_id, books_id, hiddenQuantity);
	}

}
