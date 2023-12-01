package org.sara.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.sara.domain.UsersVO;

@Mapper
public interface OrdersMapper {
	public UsersVO getUsersInfo(@Param("users_id") int users_id);
}
