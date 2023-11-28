package org.sara.service;

import org.sara.mapper.OrdersMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class OrdersServiceImpl implements OrdersService{
	@Setter(onMethod_ = @Autowired)
	private OrdersMapper OrdersMapper;
}
