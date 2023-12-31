package org.sara.service;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.BooksImgVO;
import org.sara.domain.CartsListVO;
import org.sara.domain.OrdersListVO;
import org.sara.domain.OrdersVO;
import org.sara.domain.UserVO;
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
	public UserVO getUsersInfo(@Param("users_id") int users_id) {
		return ordersMapper.getUsersInfo(users_id);
	}

	@Override
	public void insertOrdersDetail(String orders_num, @Param("books_id") List<Integer> books_id,
								   @Param("quantity") List<Integer> quantity) {
		for (int i = 0; i < books_id.size(); i++) {
			ordersMapper.insertOrdersDetail(orders_num, books_id.get(i), quantity.get(i));
			log.info("one comp " + orders_num + "<---orders_num" + books_id.get(i) + "<---books_id" + quantity.get(i) + "<---quantity");
		}
	}

	@Override
	public void insertOrders(@Param("users_id") int users_id, @Param("orders_name") String orders_name, @Param("orders_address") String orders_address,
							 @Param("orders_mobile") String orders_mobile, @Param("comment") String comment, @Param("orders_num") String orders_num,
							 @Param("status") int status) {
		ordersMapper.insertOrders(users_id, orders_name, orders_address, orders_mobile, comment, orders_num, status);
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

	@Override
	public boolean deleteCarts(int users_id, List<Integer> carts_id) {
		return cartsService.deleteCarts(users_id, carts_id);
	}
	
	@Override
	public OrdersVO getOrdersInfo(@Param("users_id") int users_id, @Param("orders_num") String orders_num) {
		
		return ordersMapper.getOrdersInfo(users_id, orders_num);
	}

	@Override
	public int getBuyBooksCount(String orders_num) {
		return ordersMapper.getBuyBooksCount(orders_num);
	}

	@Override
	public BooksImgVO getBuyBook(String orders_num) {
		return ordersMapper.getBuyBook(orders_num);
	}

	@Override
	public List<OrdersListVO> getOrderList(int users_id) {
		return ordersMapper.getOrderList(users_id);
	}

	@Override
	public List<CartsListVO> getOrdersListInfo(int users_id, String orders_num) {
		return ordersMapper.getOrdersListInfo(users_id, orders_num);
	}

	@Override
	public void setStatus(int status, String orders_num, int users_id) {
		ordersMapper.setStatus(status, orders_num, users_id);
	}

	@Override
	public boolean statusCheck(int status, String orders_num, int users_id) {
		return ordersMapper.statusCheck(status, orders_num, users_id) == 0;
	}

	@Override
	public void updatePoint(@Param("users_id") int users_id, @Param("totalPrice") int totalPrice) {
		ordersMapper.updatePoint(users_id, totalPrice);
	}

	@Override
	public void updatePointPlus(int users_id, int totalPrice) {
		ordersMapper.updatePointPlus(users_id, totalPrice);
		
	}
}
