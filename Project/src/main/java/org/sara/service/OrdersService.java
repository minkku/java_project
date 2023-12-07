package org.sara.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.sara.domain.BooksImgVO;
import org.sara.domain.CartsListVO;
import org.sara.domain.OrdersListVO;
import org.sara.domain.OrdersVO;
import org.sara.domain.UsersVO;

public interface OrdersService {
	public List<CartsListVO> getCartsList(@Param("users_id") int users_id);
	
	public UsersVO getUsersInfo(@Param("users_id") int users_id);
	
	public void insertOrdersDetail(@Param("orders_num") String orders_num, @Param("books_id") List<Integer> books_id,
								   @Param("quantity") List<Integer> quantity);
	
	public String ranOrdersNum();
	
	public void insertOrders(@Param("users_id") int users_id, @Param("orders_name") String orders_name, @Param("orders_adress") String orders_adress,
							 @Param("orders_mobile") String orders_mobile, @Param("comment") String comment, @Param("orders_num") String orders_num,
							 @Param("status") int status);
	
	public boolean deleteCarts(@Param("users_id") int users_id, @Param("carts_id") List<Integer> carts_id);
	
	public OrdersVO getOrdersInfo(@Param("users_id") int users_id, @Param("orders_num") String orders_num);
	
	public int getBuyBooksCount(@Param("orders_num") String orders_num);
	
	public BooksImgVO getBuyBook(@Param("orders_num") String orders_num);
	
	public List<OrdersListVO> getOrderList(@Param("users_id") int users_id);
}
