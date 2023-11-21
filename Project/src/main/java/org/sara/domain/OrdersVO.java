package org.sara.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrdersVO {
	int order_id;
	int carts_id_id;
	int orders_num;
	Date orders_date;
	int status_id_id;
}
