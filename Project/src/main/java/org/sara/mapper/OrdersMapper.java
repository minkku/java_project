package org.sara.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sara.domain.BooksImgVO;
import org.sara.domain.CartsListVO;
import org.sara.domain.OrdersListVO;
import org.sara.domain.OrdersVO;
import org.sara.domain.UserVO;

@Mapper
public interface OrdersMapper {
	public UserVO getUsersInfo(@Param("users_id") int users_id);
	
	public void insertOrdersDetail(@Param("orders_num") String orders_num, @Param("books_id") Integer books_id,
								   @Param("quantity") Integer quantity);
	
	public int ordersNumCheck(String ordersNum);
	
	public void insertOrders(@Param("users_id") int users_id, @Param("orders_name") String orders_name, 
				            @Param("orders_address") String orders_address, @Param("orders_mobile") String orders_mobile,
				            @Param("comment") String comment, @Param("orders_num") String orders_num, @Param("status") int status);
	
	public OrdersVO getOrdersInfo(@Param("users_id") int users_id, @Param("orders_num") String orders_num);
	
	public int getBuyBooksCount(@Param("orders_num") String orders_num);
	
	public BooksImgVO getBuyBook(@Param("orders_num") String orders_num);
	
	public List<OrdersListVO> getOrderList(@Param("users_id") int users_id);
	
	public List<CartsListVO> getOrdersListInfo(@Param("users_id") int users_id, @Param("orders_num") String orders_num);
	
	public void setStatus(@Param("status") int status, @Param("orders_num") String orders_num, @Param("users_id") int users_id);
	
	public int statusCheck(@Param("status") int status, @Param("orders_num") String orders_num, @Param("users_id") int users_id);
	
	public void updatePoint(@Param("users_id") int users_id, @Param("totalPrice") int totalPrice);
	
	public void updatePointPlus(@Param("users_id") int users_id, @Param("totalPrice") int totalPrice);
}
