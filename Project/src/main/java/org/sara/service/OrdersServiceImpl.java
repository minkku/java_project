package org.sara.service;

import java.util.List;
import java.util.Random;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListVO;
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
}
