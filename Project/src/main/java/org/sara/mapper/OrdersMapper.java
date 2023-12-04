package org.sara.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sara.domain.OrdersDetailVO;
import org.sara.domain.UsersVO;

@Mapper
public interface OrdersMapper {
	public UsersVO getUsersInfo(@Param("users_id") int users_id);
	
	public void insertOrdersDetail(@Param("orders_num") String orders_num, @Param("users_id") int users_id,
								   @Param("books_id") Integer books_id, @Param("quantity") Integer quantity);
	
	public int ordersNumCheck(String ordersNum);
	
	public void insertOrders(String orders_name, String orders_adress, String orders_mobile, String comment,
							 String orders_num, int status_id);
}
