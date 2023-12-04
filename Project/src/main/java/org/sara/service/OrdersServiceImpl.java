package org.sara.service;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListVO;
import org.sara.domain.OrdersDetailVO;
import org.sara.domain.UsersVO;
import org.sara.mapper.OrdersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class OrdersServiceImpl implements OrdersService{
	@Setter(onMethod_ = @Autowired)
	private OrdersMapper ordersMapper;
	private CartsService cartsService;

	@Override
	public List<CartsListVO> getCartsList(@Param("users_id") int users_id) {
		return cartsService.getCartsList(users_id);
	}

	@Override
	public UsersVO getUsersInfo(@Param("users_id") int users_id) {
		return ordersMapper.getUsersInfo(users_id);
	}

	@Override
	public void insertOrdersDetail(String orders_num, @Param("users_id") int users_id,
								   @Param("books_id") List<Integer> books_id, @Param("quantity") List<Integer> quantity) {
		for (int i = 0; i < books_id.size(); i++) {
			ordersMapper.insertOrdersDetail(orders_num, users_id, books_id.get(i), quantity.get(i));
			log.info("one comp " + orders_num + "<---orders_num" + users_id + "<---users_id" + books_id.get(i) + "<---books_id" + quantity.get(i) + "<---quantity");
		}
	}

	@Override
	public void insertOrders(String orders_name, String orders_adress, String orders_mobile, String comment,
							 String orders_num, int status_id) {
		ordersMapper.insertOrders(orders_name, orders_adress, orders_mobile, comment, orders_num, status_id);
	}
	
	@Override
	public String ranOrdersNum() {
		int maxAttempts = 1000;
	    String[] alpa = { "A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K",
			              "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V",
			              "W", "X", "Y", "Z", "0", "1", "2", "3", "4", "5", "6",
			              "7", "8", "9" };

	    for (int attempt = 0; attempt < maxAttempts; attempt++) {
	        StringBuilder orders_num = new StringBuilder();
	        for (int i = 0; i < 10; i++) {
	            int ran = new Random().nextInt(alpa.length);
	            orders_num.append(alpa[ran]);
	        }

	        if (ordersMapper.ordersNumCheck(orders_num.toString()) < 1) {
	            return orders_num.toString();
	        }
	    }

	    // 최대 시도 횟수를 초과한 경우, 예외 또는 특별한 처리를 수행할 수 있음
	    throw new RuntimeException("Failed to generate a unique orders number after " + maxAttempts + " attempts.");
	}

}
