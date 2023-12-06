package org.sara.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sara.domain.OrdersDetailVO;
import org.sara.domain.UsersVO;

@Mapper
public interface OrdersMapper {
	public UsersVO getUsersInfo(@Param("users_id") int users_id);
	
	public void insertOrdersDetail(@Param("orders_num") String orders_num, @Param("books_id") Integer books_id,
								   @Param("quantity") Integer quantity);
	
	public int ordersNumCheck(String ordersNum);
	
	public void insertOrders(@Param("users_id") int users_id, @Param("orders_name") String orders_name, 
				            @Param("orders_adress") String orders_adress, @Param("orders_mobile") String orders_mobile,
				            @Param("comment") String comment, @Param("orders_num") String orders_num, @Param("status") int status);
}
