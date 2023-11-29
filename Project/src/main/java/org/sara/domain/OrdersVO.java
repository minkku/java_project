package org.sara.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrdersVO {
	int orders_id; 
	int carts_id;
	String orders_name; 
	String orders_adress; 
	String orders_mobile; 
	String comment; 
	int orders_num; 
	Date orders_date; 
	int status_id;
}
