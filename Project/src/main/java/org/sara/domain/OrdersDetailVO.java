package org.sara.domain;

import lombok.Data;

@Data
public class OrdersDetailVO {
	String orders_num;
	int users_id;
	int books_id;
	int quantity;
}
