package org.sara.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrdersListVO {
	String orders_num;
	String img;
	String name;
	int count;
	Date orders_date;
	String status;
}
