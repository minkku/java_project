package org.sara.service;

import java.sql.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.CartsListVO;
import org.sara.domain.OrdersDetailVO;
import org.sara.domain.UsersVO;

public interface OrdersService {
	public List<CartsListVO> getCartsList(@Param("users_id") int users_id);
	
	public UsersVO getUsersInfo(@Param("users_id") int users_id);
	
	public void insertOrdersDetail(@Param("orders_num") String orders_num, @Param("users_id") int users_id,
			   					   @Param("books_id") List<Integer> books_id, @Param("quantity") List<Integer> quantity);
	
	public String ranOrdersNum();
	
	public void insertOrders(String orders_name, String orders_adress, String orders_mobile, String comment, String orders_num, int status_id);
}
