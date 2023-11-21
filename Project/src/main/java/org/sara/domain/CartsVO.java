package org.sara.domain;

import lombok.Data;

@Data
public class CartsVO {
	int carts_id;
	String img;
	String name;
	String content;
	int quantity;
	int price;
}