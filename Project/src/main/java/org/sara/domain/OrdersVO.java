package org.sara.domain;

import java.sql.Date;

import lombok.Data;

@Data
public class OrdersVO {
	int orders_id; 
	int users_id;
	String orders_name; 
	String orders_address; 
	String orders_mobile; 
	String comment; 
	String orders_num; 
	Date orders_date; 
	int status_id;
}
